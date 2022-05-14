package com.woniu.mall.web.front;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.woniu.mall.entity.Address;
import com.woniu.mall.entity.Order;
import com.woniu.mall.entity.User;
import com.woniu.mall.exception.MyServiceException;
import com.woniu.mall.service.AddressService;
import com.woniu.mall.service.OrderService;
import com.woniu.mall.service.ServiceProxyFactory;
import com.woniu.mall.service.UserService;
import com.woniu.mall.util.CaptchaUtil;
import com.woniu.mall.util.DateUtil;
import com.woniu.mall.util.MailTool;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;


//用户的请求
@WebServlet({"/user","/mall/user"})
@MultipartConfig
public class UserServlet extends HttpServlet {
    UserService us = ServiceProxyFactory.getProxy(UserService.class);
    OrderService os = ServiceProxyFactory.getProxy(OrderService.class);
    AddressService as = ServiceProxyFactory.getProxy(AddressService.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opr = req.getParameter("opr");
        System.out.println(opr);
        if (opr.equals("AjaxUsernameIsExist")){
            AjaxUsernameIsExist(req,resp);
        }else if (opr.equals("reg")){
            reg(req,resp);
        }else if (opr.equals("login")){
            login(req,resp);
        }else if (opr.equals("logout")){
            logout(req,resp);
        }else if (opr.equals("activation")){
            activation(req,resp);
        }else if (opr.equals("gotoUserOrder")){
            gotoUserOrder(req,resp);
        }else if (opr.equals("gotoUserCenter")){
            gotoUserCenter(req,resp);
        }else if ((opr.equals("avatar"))){
            avatar(req,resp);
        }else if (opr.equals("updatepassword")){
            updatepassword(req,resp);
        }else if (opr.equals("delAddress")){
            delAddress(req,resp);
        }else if (opr.equals("defaultAddress")){
            defaultAddress(req,resp);
        }else if (opr.equals("addAddress")){
            addAddress(req,resp);
        }
    }

    //添加地址
    private void addAddress(HttpServletRequest req, HttpServletResponse resp) {
        String accept =req.getParameter("accept");
        String telphone =req.getParameter("telphone");
        String pro =req.getParameter("pro");
        String city =req.getParameter("city");
        String coun =req.getParameter("coun");
        String street = req.getParameter("street");
        String type = req.getParameter("type");
        User user = (User) req.getSession().getAttribute("user");
        Address address = new Address();
        address.setAccept(accept);
        address.setTelephone(telphone);
        address.setProvince(pro);
        address.setCity(city);
        address.setArea(coun);
        address.setStreet(street);
        address.setIsdefault(type);
        address.setUserid(user.getId());
        as.addAddress(address,String.valueOf(user.getId()));
    }

    private void defaultAddress(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        User user = (User) req.getSession().getAttribute("user");
        as.defaultAddress(id,user);
    }

    private void delAddress(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        as.delByid(id);
    }

    //更新密码
    private void updatepassword(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String oldpwd = req.getParameter("oldpwd");
        String newpwd = req.getParameter("newpwd");
        User user = (User) req.getSession().getAttribute("user");
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        HashMap<String, String> stringStringHashMap = new HashMap<>();
        if (!oldpwd.equals(user.getPassword())){
            stringStringHashMap.put("status","500");
            stringStringHashMap.put("msg","原密码输入错误！");
            String s = JSON.toJSONString(stringStringHashMap);
            writer.print(s);
            return;
        }
        stringStringHashMap.put("status","200");
        stringStringHashMap.put("msg","密码修改成功");
        String s = JSON.toJSONString(stringStringHashMap);
        writer.print(s);
        user.setPassword(newpwd);
        us.updatePassword(user);
        //销毁当前作用域中的登录状态，让用户重新登录
        req.getSession().invalidate();
    }

    //更新头像
    private void avatar(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User user = (User) req.getSession().getAttribute("user");
        String fileName = uploadFile(req, resp);
        String path = "upload/avatar/"+fileName;
        user.setAvatar(path);
        us.updateAvatar(user);
        resp.sendRedirect("user?opr=gotoUserCenter");
    }

    //个人中心
    private void gotoUserCenter(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<Order> allOrder = os.getAllOrder(user);
        //req.getSession().setAttribute("user",user);
        req.getSession().setAttribute("allOrder",allOrder);
        //req.setAttribute("allOrder",allOrder);
        //总订单数
        List<Order> orderList = os.getWaitPayment(user);
        int allOrderList = allOrder.size();
        //获得等待支付数量
        List<Order> waitPayment = os.getWaitPayment(user);
        int waitPaymentSize = waitPayment.size();
        String sendsNum = os.getOrderStatusNums(Order.SENDED,user);
        //获得已完成的订单的金额
        String cost = os.getAlreadySpend(user);

        List<Address> userAddress = as.getUserAddress(user);
        req.getSession().setAttribute("userAddress",userAddress);
        req.getSession().setAttribute("orderList",orderList);
        req.getSession().setAttribute("sendsNum",sendsNum);
        req.getSession().setAttribute("allOrderList",allOrderList);
        req.getSession().setAttribute("waitPaymentSize",waitPaymentSize);
        req.getSession().setAttribute("cost",cost);
        req.getRequestDispatcher("/usercenter/index.jsp").forward(req,resp);
    }

    //个人订单
    private void gotoUserOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<Order> allOrder = os.getAllOrder(user);
        req.setAttribute("allOrder",allOrder);
        int size = allOrder.size();
        req.setAttribute("size",size);
        req.getRequestDispatcher("/usercenter/order_list.jsp").forward(req,resp);
    }

    private void activation(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String phoneNum = req.getParameter("phoneNum");
        String email = req.getParameter("email");
        User user = new User();
        user.setUsername(name);
        user.setPhone(phoneNum);
        user.setEmail(email);
        us.activation(user);
        resp.sendRedirect("index");
    }

    //退出登录
    private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().invalidate();
        resp.sendRedirect("index");
    }

    //登录
    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //resp.setContentType("text/html;charset=utf-8");
        resp.setContentType("application/json;charset=utf-8");
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        PrintWriter writer = resp.getWriter();
        String s = null;
        try {
            User user = us.login(account,password);
            //将登陆用户存入会话
            req.getSession().setAttribute("user",user);
            //resp.sendRedirect("index");
            s = "{\"status\":\"0\",\"username\":\""+ user.getUsername() +"\",\"msg\":\"null\"}";
            writer.println(s);
        } catch (Exception e) {
            if (e instanceof MyServiceException){
                //req.setAttribute("msg",e.getMessage());
                s = "{\"status\":\"1\",\"username\":\"null\",\"msg\":\""+e.getMessage()+"\"}";
            }else {
                //req.setAttribute("msg","系统异常！");
                s = "{\"status\":\"1\",\"username\":\"null\",\"msg\":\"系统异常\"}";
            }
            e.printStackTrace();
            writer.println(s);
            //req.getRequestDispatcher("/login.jsp").forward(req,resp);
            return;
        }

    }

    private void reg(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String cap = req.getParameter("cap");
        Integer res = (Integer)req.getSession().getAttribute("res");
        if(Integer.parseInt(cap) == res) {
            // 填写正确，注册成功
            req.getSession().removeAttribute("res");
            System.out.println("注册成功");

            String name = req.getParameter("account");
            String password = req.getParameter("password");
            String phoneNum = req.getParameter("phoneNum");
            String email = req.getParameter("email");
            String url = "http://192.168.5.15/woniumall/user?opr=activation&name="+name+"&phoneNum="+phoneNum+"&email="+email;
            MailTool.main(email,url);
            User user = new User();
            user.setUsername(name);
            user.setPassword(password);
            user.setPhone(phoneNum);
            user.setEmail(email);
            user.setScore(0);
            user.setStatus(User.ACTIVATE);
            user.setAvatar("upload/avatar/6afa72220d29f045c15217aa6b275808.png");
            user.setRegtime(DateUtil.getDate());
            user.setMoney(new BigDecimal("0"));
            us.addUser(user);

            resp.sendRedirect("index");

        } else {
            req.setAttribute("error", "验证码不正确");
            req.getRequestDispatcher("/register.jsp").forward(req,resp);
        }
    }

    //Ajax来请求 校验用户名是否存在
    private void AjaxUsernameIsExist(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String account = req.getParameter("account");
        String email = req.getParameter("email");
        if (account != null){
            us.queryByAccount(account);
        }
        if (email != null){
            us.queryByEmail(email);
        }
    }

    /**
     * 用来上传头像
     * @param req
     * @param resp
     * @return
     * @throws IOException
     * @throws ServletException
     */
    public String uploadFile(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.setCharacterEncoding("utf-8");
        Part avatar = req.getPart("avatar");
        //获取上传路径
        String upload = this.getServletContext().getRealPath("upload/avatar");
        //获取目标目录对象
        File file = new File(upload);
        //判断是否存在，不存在则创建
        if (!file.exists()) {
            file.mkdirs();
        }
        //获取上传文件名
        String submittedFileName = avatar.getSubmittedFileName();
        //获取文件后缀
        String suffix = submittedFileName.substring(submittedFileName.lastIndexOf("."));
        //随机生成文件名,uuid的随即名字有横杠间隔，转成字符串 去除横杠
        String fileName = UUID.randomUUID().toString().replaceAll("-", "") + suffix;
        //获取头像输入流
        InputStream is = avatar.getInputStream();
        //获取文件输出路径,（父目录，子文件名）
        File filePath = new File(upload, fileName);
        //获取输出流
        FileOutputStream fos = new FileOutputStream(filePath);
        byte[] b = new byte[8192];
        int len = -1;
        while ((len = is.read(b)) != -1) {
            fos.write(b, 0, len);
        }
        is.close();
        fos.close();
        return fileName;
    }
}

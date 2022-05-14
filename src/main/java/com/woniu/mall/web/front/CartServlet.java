package com.woniu.mall.web.front;

import com.alibaba.fastjson.JSON;
import com.woniu.mall.entity.Cart;
import com.woniu.mall.entity.User;
import com.woniu.mall.service.CartService;
import com.woniu.mall.service.ServiceProxyFactory;
import com.woniu.mall.util.DateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    CartService cs = ServiceProxyFactory.getProxy(CartService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opr = req.getParameter("opr");
        System.out.println(opr);
        if (opr.equals("addCart")){
            addCart(req,resp);
        }else if (opr.equals("indexCart")){
            indexCart(req,resp);
        }else if (opr.equals("gotoCart")){
            gotoCart(req,resp);
        }else if (opr.equals("updateChecked")){
            updateChecked(req,resp);
        }else if (opr.equals("updateCartNum")){
            updateCartNum(req,resp);
        }else if (opr.equals("delCart")){
            delCart(req,resp);
        }
    }

    //删除购物车记录
    private void delCart(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        cs.delCart(id);
    }

    //更新数量
    private void updateCartNum(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        String num = req.getParameter("num");
        cs.updateCartNum(id,num);
    }

    //更新选中状态
    private void updateChecked(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        String status = req.getParameter("status");
        cs.updateIschecked(id,status);
    }

    private void gotoCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cart> cartList = cs.queryAllCart((User) req.getSession().getAttribute("user"));
        req.setAttribute("cartList",cartList);
        req.getRequestDispatcher("/cart.jsp").forward(req,resp);
    }

    /**
     * 异步请求接口
     * 用来更新右上角悬浮购物车的内容
     * @param req
     * @param resp
     */
    private void indexCart(HttpServletRequest req, HttpServletResponse resp) {
        User user = (User) req.getSession().getAttribute("user");
        List<Cart> carts = cs.queryAllCart(user);
    }

    private void addCart(HttpServletRequest req, HttpServletResponse resp) {
        String userid = req.getParameter("userid");
        String goodsid = req.getParameter("goodsid");
        String num = req.getParameter("num");
        String addprice = req.getParameter("addprice");
        Cart cart = new Cart();
        cart.setUserid(Integer.parseInt(userid));
        cart.setGoodsid(Integer.parseInt(goodsid));
        cart.setNum(Integer.parseInt(num));
        cart.setAddprice(new BigDecimal(addprice));
        cart.setAddtime(DateUtil.getDate());
        cart.setIschecked(Cart.UNCHECKED);
        //添加购物信息
        cs.addCart(cart);
    }


}

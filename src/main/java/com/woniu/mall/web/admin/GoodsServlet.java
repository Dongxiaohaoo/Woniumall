package com.woniu.mall.web.admin;


import com.github.pagehelper.PageInfo;
import com.woniu.mall.entity.Category;
import com.woniu.mall.entity.Goods;
import com.woniu.mall.service.CategoryService;
import com.woniu.mall.service.GoodsService;
import com.woniu.mall.service.ServiceProxyFactory;
import com.woniu.mall.util.DateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Dictionary;
import java.util.List;
import java.util.UUID;

@WebServlet("/admin/goods")
@MultipartConfig
public class GoodsServlet extends HttpServlet {
    GoodsService gs = ServiceProxyFactory.getProxy(GoodsService.class);
    CategoryService cs = ServiceProxyFactory.getProxy(CategoryService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String opr = req.getParameter("opr");
        System.out.println(opr);
        if (opr.equals("getAll")) {
            getAll(req, resp);
        } else if (opr.equals("delChecked")) {
            delChecked(req, resp);
        } else if (opr.equals("addGoods")) {
            addGoods(req, resp);
        } else if (opr.equals("GoodsAdd")) {
            GoodsAdd(req, resp);
        }else if (opr.equals("soldOut")){
            soldOut(req,resp);
        }else if (opr.equals("shelves")){
            shelves(req,resp);
        }else if (opr.equals("updateGoods")){
            updateGoods(req,resp);
        }else if (opr.equals("submitUpdate")){
            submitUpdate(req,resp);
        }
    }

    //????????????
    private void submitUpdate(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String categoryId = req.getParameter("categoryId");
        String stock = req.getParameter("stock");
        String author = req.getParameter("author");
        String publisher = req.getParameter("publisher");
        String publishtime = req.getParameter("publishtime");
        String marketprice = req.getParameter("marketprice");
        String saleprice = req.getParameter("saleprice");
        String isnew = req.getParameter("isnew");
        String ishot = req.getParameter("ishot");
        String salenum = req.getParameter("salenum");
        String remarknum = req.getParameter("remarknum");
        String remarkscore = req.getParameter("remarkscore");
        String status = req.getParameter("status");
        String content = req.getParameter("content");
        //??????id?????????
        Goods goodsById = gs.getGoodsById(Integer.parseInt(id));
        try {
            Part image = req.getPart("image");
            String s = doUpload(image);
            goodsById.setImage("upload/"+s);
        } catch (Exception e) {
            System.out.println("????????????");
            goodsById.setImage(null);
        }
        goodsById.setName(name);
        goodsById.setCategoryid(Integer.parseInt(categoryId));
        goodsById.setStock(Integer.parseInt(stock));
        goodsById.setAuthor(author);
        goodsById.setPublisher(publisher);
        goodsById.setPublishtime(publishtime);
        goodsById.setMarketprice(new BigDecimal(marketprice));
        goodsById.setSaleprice(new BigDecimal(saleprice));
        goodsById.setIsnew(isnew);
        goodsById.setIshot(ishot);
        goodsById.setSalenum(Integer.parseInt(salenum));
        goodsById.setRemarknum(Integer.parseInt(remarknum));
        goodsById.setRemarkscore(new BigDecimal(remarkscore));
        goodsById.setStatus(status);
        goodsById.setDescription(content);

        gs.updateGoods(goodsById);
        getAll(req,resp);
    }

    //??????????????????
    private void updateGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //?????????id??? ????????????
        String id = req.getParameter("id");
        Goods goodsById = gs.getGoodsById(Integer.parseInt(id));
        List<Category> allCategory = cs.getAllCategory();
        req.setAttribute("goodsById",goodsById);
        req.setAttribute("categories",allCategory);
        req.getRequestDispatcher("/admin/goods_update.jsp").forward(req,resp);
    }

    //????????????
    private void shelves(HttpServletRequest req, HttpServletResponse resp) {
        String[] ids = req.getParameterValues("id");
        System.out.println(Arrays.toString(ids));
        gs.shelves(DateUtil.StringToInt(ids),DateUtil.getDate());
        //????????????
        getAll(req, resp);
    }

    //??????????????????
    private void soldOut(HttpServletRequest req, HttpServletResponse resp) {
        String[] ids = req.getParameterValues("id");
        System.out.println(Arrays.toString(ids));
        gs.soldOut(DateUtil.StringToInt(ids),DateUtil.getDate());
        //????????????
        getAll(req, resp);
    }

    private void GoodsAdd(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String name = req.getParameter("name");
        String categoryId = req.getParameter("categoryId");
        String stock = req.getParameter("stock");
        String author = req.getParameter("author");
        String publishier = req.getParameter("publishier");
        String publishtime = req.getParameter("publishtime");
        String marketprice = req.getParameter("marketprice");
        String saleprice = req.getParameter("saleprice");
        String isnew = req.getParameter("isnew");
        String ishot = req.getParameter("ishot");
        String content = req.getParameter("content");
        //????????????
        Part image = req.getPart("image");
        String randomFileName = doUpload(image);

        Goods goods = new Goods();
        goods.setName(name);
        goods.setCategoryid(Integer.parseInt(categoryId));
        goods.setStock(Integer.parseInt(stock));
        goods.setAuthor(author);
        goods.setPublisher(publishier);
        goods.setPublishtime(publishtime);
        goods.setMarketprice(new BigDecimal(marketprice));
        goods.setSaleprice(new BigDecimal(saleprice));
        goods.setIsnew(isnew);
        goods.setIshot(ishot);
        goods.setDescription(content);
        goods.setImage("upload/"+randomFileName);
        gs.addGoods(goods);
        //????????????????????????
        getAll(req,resp);
    }

    private String doUpload(Part image) throws IOException {
        //??????????????????
        String upload = this.getServletContext().getRealPath("upload");
        //????????????????????????
        File file = new File(upload);
        //???????????????????????????????????????
        if (!file.exists()) {
            file.mkdirs();
        }
        //?????????????????????
        String submittedFileName = image.getSubmittedFileName();
        //??????????????????
        String suffix = submittedFileName.substring(submittedFileName.lastIndexOf("."));
        //?????????????????????,uuid???????????????????????????????????????????????? ????????????
        String fileName = UUID.randomUUID().toString().replaceAll("-", "") + suffix;
        //?????????????????????
        InputStream is = image.getInputStream();
        //????????????????????????,??????????????????????????????
        File filePath = new File(upload, fileName);
        //???????????????
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


    //????????????
    private void addGoods(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Category> allCategory = cs.getAllCategory();
            req.setAttribute("categoryList", allCategory);
            req.getRequestDispatcher("/admin/goods_add.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //????????????
    private void delChecked(HttpServletRequest req, HttpServletResponse resp) {
        String[] ids = req.getParameterValues("id");
        System.out.println(Arrays.toString(ids));
        gs.delByid(DateUtil.StringToInt(ids));
        //????????????
        getAll(req, resp);
    }


    //????????????
    private void getAll(HttpServletRequest req, HttpServletResponse resp) {
        //List<Goods> allGoods = gs.getAllGoods();
        //List<Goods> allGoods = goodsByPage.getList();
        //req.setAttribute("allGoods", allGoods);

        String pageNum = req.getParameter("page");
        String pageSize = req.getParameter("pageSize");
        Integer num = 1;
        Integer size = 5;
        if (pageNum != null && !pageNum.equals("")){
            num = Integer.parseInt(pageNum);
        }
        if (pageSize != null && !pageSize.equals("")){
            size = Integer.parseInt(pageSize);
        }

        //1???????????????????????????
        String name = req.getParameter("title");
        String typeid = req.getParameter("typeid");
        String status = req.getParameter("status1");
        Goods goods = new Goods();
        Integer tpId = null;
        if (typeid != null && !typeid.equals("")){
            tpId = Integer.parseInt(typeid);
        }
        goods.setName(name);
        goods.setCategoryid(tpId);
        goods.setStatus(status);

        //????????????
        PageInfo goodsByPage = gs.getGoodsByPage(num,size,goods);
        //?????????????????????
        List<Category> allCategory = cs.getAllCategory();
        req.setAttribute("allCategory",allCategory);
        req.setAttribute("pageSize",size);
        req.setAttribute("goodsByPage",goodsByPage);

        req.setAttribute("status1",status);
        req.setAttribute("typeid",typeid);
        req.setAttribute("name",name);

        try {
            req.getRequestDispatcher("/admin/goods_list.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println("??????????????????...");
            e.printStackTrace();
        }
    }
}

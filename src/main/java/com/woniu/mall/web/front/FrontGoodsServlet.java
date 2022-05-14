package com.woniu.mall.web.front;

import com.github.pagehelper.PageInfo;
import com.woniu.mall.entity.Goods;
import com.woniu.mall.service.GoodsService;
import com.woniu.mall.service.ServiceProxyFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/frontGoods")
public class FrontGoodsServlet extends HttpServlet {
    GoodsService gs = ServiceProxyFactory.getProxy(GoodsService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String opr = req.getParameter("opr");
        System.out.println(opr);
        if (opr.equals("gotoDetil")){
            gotoDetil(req,resp);
        }else if (opr.equals("category")){
            category(req,resp);
        }else if(opr.equals("fuzzySearch")){
            fuzzySearch(req,resp);
        }
    }

    //模糊搜索
    private void fuzzySearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("word");
        String pNum = req.getParameter("pageNun");
        String pSize = req.getParameter("pageSize");
        Integer pageNun = 1;
        Integer pageSize = 12;
        if (pNum != null && !pNum.equals("")){
            pageNun = Integer.parseInt(pNum);
        }
        if (pSize != null && !pSize.equals("")){
            pageSize = Integer.parseInt(pSize);
        }

        PageInfo<Goods> goodsPageInfo = gs.getGoodsByName(name, pageNun, pageSize);
        List<Goods> goodsList = goodsPageInfo.getList();
        req.setAttribute("pageNun",pageNun);
        req.setAttribute("pageSize",pageSize);
        req.setAttribute("NewGoodsList",goodsList);
        req.setAttribute("goodsPageInfo",goodsPageInfo);
        req.setAttribute("word",name);
        req.getRequestDispatcher("index.jsp").forward(req,resp);

    }

    //分类查询
    private void category(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer i = Integer.parseInt(req.getParameter("id"));
        List<Goods> NewGoodsList = gs.getGoodsByCategoryId(i);
        String pNum = req.getParameter("pageNun");
        String pSize = req.getParameter("pageSize");
        Integer pageNun = 1;
        Integer pageSize = 12;
        PageInfo<Goods> goodsPageInfo = gs.getGoodsByName(null, pageNun, pageSize);
        req.setAttribute("NewGoodsList",NewGoodsList);
        req.setAttribute("goodsPageInfo",goodsPageInfo);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    //转到详细页面
    private void gotoDetil(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Goods goods = gs.getGoodsById(Integer.parseInt(id));
        req.setAttribute("goods",goods);
        req.getRequestDispatcher("/goods_view.jsp").forward(req,resp);
    }
}

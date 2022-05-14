package com.woniu.mall.service;

import com.woniu.mall.entity.Category;
import com.woniu.mall.entity.Goods;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.List;

@WebServlet(name = "init", urlPatterns = { "/init" }, loadOnStartup = 1)
public class InitServlet extends HttpServlet {
	public void init() throws ServletException {
		ServletContext context = getServletContext();
		context.setAttribute("base", context.getContextPath());
		context.setAttribute("site", "蜗牛图书商城");

		//初始化首页商品
		GoodsService gs = ServiceProxyFactory.getProxy(GoodsService.class);
		CategoryService cs = ServiceProxyFactory.getProxy(CategoryService.class);
		List<Goods> NewGoodsList = gs.getNewGoods(12);//获取最新书
		List<Goods> HotGoodsList = gs.getHotGoods(10);//获取热卖书
		List<Category> allCategory = cs.queryNormalCategory();//获取所有分类
		context.setAttribute("NewGoodsList",NewGoodsList);
		context.setAttribute("HotGoodsList",HotGoodsList);
		context.setAttribute("allCategory",allCategory);
	}
}

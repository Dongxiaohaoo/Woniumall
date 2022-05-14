package com.woniu.mall.web.front;

import com.woniu.mall.entity.Cart;
import com.woniu.mall.entity.Category;
import com.woniu.mall.entity.Goods;
import com.woniu.mall.entity.User;
import com.woniu.mall.service.CartService;
import com.woniu.mall.service.CategoryService;
import com.woniu.mall.service.GoodsService;
import com.woniu.mall.service.ServiceProxyFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
    GoodsService gs = ServiceProxyFactory.getProxy(GoodsService.class);
    CategoryService cs = ServiceProxyFactory.getProxy(CategoryService.class);
    CartService carts = ServiceProxyFactory.getProxy(CartService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String opr = req.getParameter("opr");
        System.out.println(opr);
        if (opr == null){
            sendRedirect(req,resp);
        }
    }

    private void sendRedirect(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cart> cartList = carts.queryAllCart((User) req.getSession().getAttribute("user"));
        Integer cartNums = cartList.size();
        //ServletContext context = getServletContext();
        //购物车条数设成全局作用域
        req.getSession().setAttribute("cartNums",cartNums);
        req.getSession().setAttribute("cartList",cartList);

        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}

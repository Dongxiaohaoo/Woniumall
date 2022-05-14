package com.woniu.mall.web.admin;

import com.woniu.mall.entity.Category;
import com.woniu.mall.entity.Goods;
import com.woniu.mall.exception.MyServiceException;
import com.woniu.mall.service.CategoryService;
import com.woniu.mall.service.GoodsService;
import com.woniu.mall.service.ServiceProxyFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/category")
public class CategoryServlet extends HttpServlet {
    CategoryService cs = ServiceProxyFactory.getProxy(CategoryService.class);
    GoodsService gs = ServiceProxyFactory.getProxy(GoodsService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String opr = req.getParameter("opr");
        System.out.println(opr);
        if (opr.equals("gotoCategoryAdd")){
            gotoCategoryAdd(req,resp);
        }else if (opr.equals("addCategory")){
            addCategory(req,resp);
        }else if (opr.equals("gotoCategoryList")){
            refreshList(req,resp);
        }else if (opr.equals("delCategory")){
            delCategory(req,resp);
        }else if (opr.equals("updateCategory")){
            updateCategory(req,resp);
        }else if (opr.equals("updateCategory2")){
            updateCategory2(req,resp);
        }else {
            System.out.println("opr not fount...");
        }
    }

    //提交修改项
    private void updateCategory2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String status = req.getParameter("status");
        //根据id查对象
        Category categoryById = cs.getCategoryById(Integer.parseInt(id));
        try {
            categoryById.setName(title);
            categoryById.setStatus(status);
            cs.updateCategory(categoryById);
            req.setAttribute("msg","修改成功！");
        } catch (Exception e) {
            if (e instanceof MyServiceException){
                req.setAttribute("msg",e.getMessage());
            }else {
                req.setAttribute("msg","系统繁忙...");
            }
            //已经存在
            req.setAttribute("category",categoryById);
        }
        req.getRequestDispatcher("update_category.jsp").forward(req,resp);
    }



    //给修改页面表单赋值
    private void updateCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Category category = cs.getCategoryById(Integer.parseInt(id));
        req.setAttribute("category",category);
        req.getRequestDispatcher("update_category.jsp").forward(req,resp);
    }

    /**
     * 删除分类，删除之前检查分类是否有商品
     * @param req
     * @param resp
     */
    private void delCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取商品id
        String id = req.getParameter("id");
        try {
            cs.delCategory(Integer.parseInt(id));
            req.setAttribute("msg","删除成功！");
        } catch (Exception e) {
            if (e instanceof MyServiceException){
                req.setAttribute("msg","该分类下还有商品未处理！");
            }else{
                req.setAttribute("msg","系统繁忙，操作失败...");
            }
            e.printStackTrace();
        }
        refreshList(req,resp);
    }

    private void addCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Category c = new Category();
        c.setName(name);
        try {
            cs.addCategory(c);
            req.setAttribute("msg","添加成功！");
        }catch (Exception e){
            if (e instanceof MyServiceException){
                req.setAttribute("msg",e.getMessage());
                req.setAttribute("categoryName",name);
            }else {
                req.setAttribute("msg","系统繁忙");
            }
            req.getRequestDispatcher("category_add.jsp").forward(req,resp);
        }
        refreshList(req,resp);
    }

    /**
     * 刷新列表
     * @param req
     * @param resp
     */
    private void refreshList(HttpServletRequest req, HttpServletResponse resp) {
        List<Category> allCategory = cs.getAllCategory();
        req.setAttribute("allCategory",allCategory);
        try {
            req.getRequestDispatcher("category_list.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("刷新列表异常...");
        }
    }


    /**
     * 跳转到添加种类页面
     * @param req
     * @param resp
     */
    private void gotoCategoryAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("category_add.jsp").forward(req,resp);
    }



}

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <meta charset="UTF-8">
    <title>论文管理系统-论文列表</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    <script>
        function gotoPage(pageNum) {
            // window.location.href = "admin/user?opr=getAll&page=" + pageNum + "&pageSize=" + pageSize.value;
            var pSize = document.getElementById("pSize").value;
            // var page = document.getElementById("page").value;
            console.log("pSize:"+pSize+" page:"+pageNum)
            document.getElementById("myform").querySelector("input[name=page]").value = pageNum;
            document.getElementById("myform").querySelector("input[name=pageSize]").value = pSize;
            document.getElementById("myform").submit();
        }
        function query() {
            var status1 = document.getElementById("status1").value;
            var title = document.getElementById("title").value;
            window.location.href = "admin/user?opr=getAll&page=" + 1 + "&pageSize=" + pageSize.value +"&status1="+status1+"&title="+title;
            console.log("admin/user?opr=getAll&page=" + 1 + "&pageSize=" + pageSize.value +"&status1="+status1+"&title="+title)
        }
    </script>
    <style type="text/css">
        .table tbody tr td {
            vertical-align: middle;
        }

        table {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div>
    <div>
        <!-- 路径导航  -->
        <ol class="breadcrumb">
            <li class="active">你现在的位置是：用户管理</li>
            <li><a href="admin/user?opr=getAll">用户列表</a></li>
        </ol>
    </div>
    <div style="padding-left: 10px; padding-right: 10px;">
        <!-- 多条件查询 -->
        <form class="form-inline" id="myform" action="admin/user">
            <input type="hidden" name="opr" value="getAll">
            <input type="hidden" name="page" id="page" value="${userPageInfo.pageNum}">
            <input type="hidden" name="pageSize" id="pSize" value="${userPageInfo.pageSize}">
            <div class="form-group">
                <label for="title">用户名：</label> <input type="text"
                                                       class="form-control" name="title" id="title"
                                                       placeholder="请输入用户名称" value="${name}">
            </div>
            <div class="form-group">
                用户状态：
                <select name="status1" id="status1" class="form-control">
                    <option value="">---请选择---</option>
                    <option value="0"
                            <c:if test="${status1 eq '0'}">selected</c:if>    >正常
                    </option>
                    <option value="1"
                            <c:if test="${status1 eq '1'}">selected</c:if>    >待激活
                    </option>
                    <option value="2"
                            <c:if test="${status1 eq '2'}">selected</c:if>    >锁定
                    </option>
                </select>
                <button type="button" id="btnQuery" class="btn btn-primary" onclick="query()">查询</button>
                <button type="button" class="btn btn-warning" onclick="clearCondition()">情况条件</button>
            </div>
        </form>
    </div>
    <!-- 多条件查询结束 -->
    <div style="padding-left: 10px; padding-right: 10px;">
        <!-- 数据列表 -->
        <table class="table table-bordered">
            <thead>
            <tr>
                <th class="col-md-1 text-center">序号</th>
                <th class="col-md-3 text-center">账号</th>
                <th class="col-md-1 text-center">邮箱</th>
                <th class="col-md-2 text-center">积分</th>
                <th class="col-md-2 text-center">注册时间</th>
                <th class="col-md-2 text-center">状态</th>
                <th class="col-md-2 text-center">操作</th>
            </tr>
            </thead>
            <tbody id="tbd">
            <c:forEach var="user" items="${users}" varStatus="vs">
                <tr class="text-center">
                    <td>${vs.count}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.score}</td>
                    <td>${user.regtime}</td>
                    <td>
                        <c:if test="${user.status eq '0'}">
                            正常
                        </c:if>
                        <c:if test="${user.status eq '1'}">
                            待激活
                        </c:if>
                        <c:if test="${user.status eq '2'}">
                            锁定
                        </c:if>
                    </td>
                    <td>
                            <%--删除分类--%>
                        <c:if test="${user.status eq '0'}">
                            <a href="admin/user?opr=updateUserStatus&id=${user.id}&status=2"
                               class="btn btn-danger btn-sm"><span
                                    class="glyphicon glyphicon-pencil"></span>锁定</a>&nbsp;&nbsp;
                        </c:if>
                        <c:if test="${user.status eq '1'}">
                            <a href="admin/user?opr=updateUserStatus&id=${user.id}&status=0"
                               class="btn btn-primary btn-sm"><span
                                    class="glyphicon glyphicon-pencil"></span>激活</a>&nbsp;&nbsp;
                        </c:if>
                        <c:if test="${user.status eq '2'}">
                            <a href="admin/user?opr=updateUserStatus&id=${user.id}&status=0"
                               class="btn btn-success btn-sm"><span
                                    class="glyphicon glyphicon-pencil"></span>解锁</a>&nbsp;&nbsp;
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <tfoot>
        <!--分页组件-->
        <div style="margin:0px;text-align:center;margin-top:0px;border-top: 0px solid #CCCCCC;">
            <ul class="pagination">
                <li>
                    <a href="javascript:gotoPage(1)" title="首页">首页</a>
                </li>
                <li>
                    <a href="javascript:gotoPage(${userPageInfo.prePage})" title="上一页">上一页</a>
                </li>
                <c:forEach var="page" items="${userPageInfo.navigatepageNums}" varStatus="vs">
                    <li <c:if test="${page eq userPageInfo.pageNum}">class="active"</c:if>>
                        <a href="javascript:gotoPage(${page})">${page}</a></li>
                </c:forEach>
                <li>
                    <a href="javascript:gotoPage(${userPageInfo.nextPage})" title="下一页">下一页</a>
                </li>
                <li>
                    <a href="javascript:gotoPage(${userPageInfo.pages})" title="尾页">尾页</a>
                </li>
                <li>
                    总记录 ${userPageInfo.total} 总页数 ${userPageInfo.pages} 当前第 ${userPageInfo.pageNum} 页 转到
                    <input type="number" style="width:30px;text-align: center;" class="input" value="1" id="skipPage"/>
                    页
                    <input type="number" style="width:30px;text-align: center;" class="input" value="${pageSize}"
                           onchange="javascript:window.location.href='admin/user?opr=getAll&page=1&pageSize='+pageSize.value"
                           id="pageSize"/> 条记录
                    <button type="button" class="btn btn-primary active"
                            onclick="javascript:window.location.href='admin/user?opr=getAll&page='+skipPage.value">确定
                    </button>
                    <br>
                </li>
            </ul>
        </div>
        </tfoot>
        <span>${msg}</span>
        <a href="admin/category?opr=gotoCategoryAdd" class="btn btn-primary">添加用户</a>
    </div>
</div>

</body>
</html>
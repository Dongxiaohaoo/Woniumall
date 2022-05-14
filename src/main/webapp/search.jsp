<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function () {
        $('.allsort').hover(function () {
            $('#div_allsort').show();
        }, function () {
            $('#div_allsort').hide();
        });
    });
    function validataFrom() {
        let elementsByNameElement = document.getElementsByName("word")[0];
        if (elementsByNameElement.value == ''){
            alert("请输入关键字")
            return false;
        }
        return true;
    }
</script>
<div class="searchbar">
    <div class="allsort">
        <a href="javascript:void(0);">全部商品分类</a>
        <!--总的商品分类-开始-->
        <ul class="sortlist" id='div_allsort' style='display:none'>
            <%--            <li>--%>
            <%--                <h2>--%>
            <%--                    <a href="">手机</a>--%>
            <%--                </h2>--%>
            <%--            </li>--%>
            <%--            <li>--%>
            <%--                <h2>--%>
            <%--                    <a href="">平板</a>--%>
            <%--                </h2>--%>
            <%--            </li>--%>

            <c:forEach var="Category" items="${allCategory}">
                <li>
                    <h2>
                        <a href="frontGoods?opr=category&id=${Category.id}">${Category.name}</a>
                    </h2>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div class="searchbox">
        <form method='post' action='frontGoods?opr=fuzzySearch' id="myform" onsubmit="return validataFrom()">
            <input type="hidden" name="pageSize" id="pSize" value="${goodsPageInfo.pageSize}">
            <input type="hidden" name="pageNun" id="page" value="1">
<%--            <input type='hidden' name='controller' value='site'/>--%>
<%--            <input type='hidden' name='action' value='search_list'/>--%>
            <input class="text" type="text" name='word'id="word" autocomplete="off" value="${word}"  placeholder="输入关键字..."/>
            <input class="btn" type="submit" value="商品搜索"/>
        </form>

    </div>
    <div class="hotwords">热门搜索：Java</div>
</div>
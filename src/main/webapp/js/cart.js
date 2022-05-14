//删除商品
function delThis(res, id) {
    //DOM删除这一行
    res.parentNode.parentNode.remove();
    axios.get("cart?opr=delCart&id=" + id);
}

//更新购物车数量
function AjaxUpdateNum(Num, id) {
    // document.getElementById("").addEventListener("change", function () {
    //     if (isNaN(this.value)) {
    //         layer.alert("请输入正确的购买数量");
    //         return;
    //     }
    // });

    axios.get("cart?opr=updateCartNum&id=" + id + "&num=" + Num);
}


//存入旧的数量，遇到非法数字就恢复之前合法的数量
function reduceNum(Num) {
    //获取当前行数的数量
    let elementsByClassName = document.getElementsByClassName("tiny")[Num];
    //获取
    let old = elementsByClassName.value;
    //获取当前行数的总价
    let count = document.getElementsByClassName("red2")[Num];
    //获取当前行数的单价
    let saleprice = document.getElementsByClassName("saleprice")[Num];
    if (parseInt(old) == 1) {
        alert("最少购买一本");
        return;
    }
    let m = elementsByClassName.value = parseFloat(old) - 1;

    //获取
    AjaxUpdateNum(m, elementsByClassName.parentNode.getAttribute("value"));


    //获取计算得到的新价格
    let newCount = (parseFloat(saleprice.innerText) * m).toFixed(2);
    count.innerText = newCount;
    total()
}

function addNum(Num) {
    //获取当前行数对印的数量
    let elementsByClassName = document.getElementsByClassName("tiny")[Num];
    let old = elementsByClassName.value;
    //获取当前行数的总价
    let count = document.getElementsByClassName("red2")[Num];
    //获取当前行数的单价
    let saleprice = document.getElementsByClassName("saleprice")[Num];

    let m = elementsByClassName.value = parseFloat(old) + 1;

    AjaxUpdateNum(m, elementsByClassName.parentNode.getAttribute("value"));


    //获取计算得到的新价格
    let newCount = (parseFloat(saleprice.innerText) * m).toFixed(2);
    count.innerText = newCount;
    total()
}

function total(cartid, checbx) {
    //获取总价节点
    let elementById = document.getElementById("sum_price");
    //获取所有checkbox
    let checkbox = document.getElementsByClassName("checkbox");
    //获取所有的小计价格节点
    let count = document.getElementsByClassName("red2");
    let total = 0;
    //记录选中数量
    let checkedCount = 0;

    for (let i = 0; i < checkbox.length; i++) {
        if (checkbox[i].checked) {
            //选中节点的小计总价
            // console.log(count[i].innerText);
            total += parseFloat(count[i].innerText);
            checkedCount++;
        }
    }
    // console.log(total);
    elementById.innerText = total.toFixed(2);
    //用来确定是否全选
    if (checkbox.length == checkedCount) {
        document.getElementById("checkAll").checked = true;
    } else {
        document.getElementById("checkAll").checked = false;
    }
    //用来给Ajax来请求更新选中状态
    if (cartid != undefined) {
        let ischeck = null;
        if (checbx.checked) {
            ischeck = 0;
        } else {
            ischeck = 1;
        }
        axios.get("cart?opr=updateChecked&id=" + cartid + "&status=" + ischeck);
        // console.log("cartId:"+cartid+"状态：")
    }
}

function checkAll1() {
    //全选按钮节点
    let checkAll = document.getElementById("checkAll");
    //需要全选的子节点
    let checkbox = document.getElementsByClassName("checkbox");

    if (checkAll.checked) {
        for (let i = 0; i < checkbox.length; i++) {
            checkbox[i].checked = true;
            total(checkbox[i].value, checkbox[i]);
        }
    } else {
        for (let i = 0; i < checkbox.length; i++) {
            checkbox[i].checked = false;
            total(checkbox[i].value, checkbox[i]);
        }
    }
}

//加载页面 查看几个选中了
total()
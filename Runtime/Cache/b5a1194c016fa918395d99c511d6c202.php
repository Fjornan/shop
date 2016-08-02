<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">

<link href="../Public/css/bootstrap.min.css" rel="stylesheet">
<link href="../Public/css/swiper.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../Public/css/style.css">
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>   
<script src="../Public/js/swiper.jquery.min.js"></script>
<script src="../Public/js/common.js"></script>  
<title>门店信息</title>

</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container text-center">
        <span class="glyphicon glyphicon-menu-left winback" onClick="winTo('index')"></span>
        <span class="head-title">门店信息</span  >
        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
</nav>
<div class="container store-contain" style="margin-top:50px; font-size:24px;color:#f90">
    <marquee style="height:100%;line-height:100%;">O(∩_∩)O微信家电城欢迎您的光临！</marquee>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
        <ul class="row list-unstyled index-bottom">
            <li id="index" class="col-xs-3"><span class="glyphicon glyphicon-home"></span><p>首页</p></li>
            <li id="goodslist" class="col-xs-3"><span class="glyphicon glyphicon-th-list"></span><p>所有商品</p></li>
            <li id="shoppingcart" class="col-xs-3"><span class="glyphicon glyphicon-shopping-cart"></span><p>购物车</p></li>
            <li id="personal.Tpl" class="col-xs-3"><span class="glyphicon glyphicon-user"></span><p>会员中心</p></li>
        </div>
    </div>
</nav>
</body>
</html>

<script>
//页面跳转
$(".index-bottom li").click(function(e) {
   var winname = $(this).attr("id");
   window.location.href= SHOP +'/Display/'+winname;
});
//页面跳转
function winTo(winname){
    window.location.href=SHOP+'/Display/'+winname;
}
$(function(){
    $(".store-contain").css('height',$(window).height()-110);
})
</script>
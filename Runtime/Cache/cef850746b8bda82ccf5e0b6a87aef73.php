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
<title>会员中心</title>

</head>

<body>
<div class="container personal-head text-center">
	<div class="personal-pic pic-suit">
    </div>
    <div class="personal-name">
    	
    </div>
</div>
<div class="container personal-message" style="padding:0px">
	<div class="mid-blur" style="background-color:#eee"></div>
	<!--       我的订单       -->
	<div class="personal-order">
    	<div class="message-list" onclick="winTo('myorder','0')">
        	<span class="message-left-pic pic-suit personal-order-pic"></span>
            <p class="message-title">我的订单</p>
            <span class="message-right-arr"></span>
            <div class="small-blur" style="background-color:#eee"></div>
        </div>
        <div class="small-blur" style=" background-color:#eee"></div>
        <div class="container">
       	<ul class="order-assortment row list-unstyled">
        	<li class="col-xs-4 text-center" onclick="winTo('myorder','1')"><span class="glyphicon glyphicon-time"></span><p>待付款</p></li>
            <li class="col-xs-4 text-center" onclick="winTo('myorder','2')"><span class="glyphicon glyphicon-time"></span><p>进行中</p></li>
            <li class="col-xs-4 text-center" onclick="winTo('myorder','3')"><span class="glyphicon glyphicon-time"></span><p>已完成</p></li>
        </ul>
        </div>
    </div>
    <div class="mid-blur" style="background-color:#eee" ></div>
    <!--        我的地址           -->
    <div class="personal-address" onclick="winTo('myaddress')">
    	<div class="message-list">
        	<span class="message-left-pic pic-suit personal-address-pic"></span>
            <p class="message-title">我的地址</p>
            <span class="message-right-arr"></span>
            <div class="small-blur" style="background-color:#eee"></div>
        </div>
    </div>
    <div class="small-blur" style="background-color:#eee"></div>
    <!--         我的卡券          -->
    <div class="personal-coupon" onclick="winTo('mycoupon')">
    	<div class="message-list">
        	<span class="message-left-pic pic-suit personal-coupon-pic"></span>
            <p class="message-title">我的卡券</p>
            <span class="message-right-arr"></span>
            <div class="small-blur" style="background-color:#eee"></div>
        </div>
    </div>
    <div class="small-blur" style="background-color:#eee"></div>
    <!--         我的收藏          -->
    <div class="personal-collection">
    	<div class="message-list">
        	<span class="message-left-pic pic-suit personal-collection-pic"></span>
            <p class="message-title">我的收藏</p>
            <span class="message-right-arr"></span>
            <div class="small-blur" style="background-color:#eee"></div>
        </div>
    </div>
    <div class="small-blur" style="background-color:#eee"></div>

</div>

<nav class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">
    	<ul class="row list-unstyled index-bottom">
			<li id="index" class="col-xs-3"><span class="glyphicon glyphicon-home"></span><p>首页</p></li>
            <li id="goodslist" class="col-xs-3"><span class="glyphicon glyphicon-th-list"></span><p>所有商品</p></li>
            <li id="shoppingcart" class="col-xs-3"><span class="glyphicon glyphicon-shopping-cart"></span><p>购物车</p></li>
            <li id="personal.Tpl" class="col-xs-3 bottom-active"><span class="glyphicon glyphicon-user"></span><p>会员中心</p></li>
        </ul>
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
function winTo(winname,status){
    window.location.href=SHOP+'/Display/'+winname+'?status='+status;
}

$(function(){
    $.ajax({
        type: "post",  
        url: SHOP + "/Personal/userMessage",  
        dataType: "json",   
        success: function(data){    
            $(".personal-pic").css("background-image","url("+SHOP+"/Tpl/"+data[0].user_pic+")");
            $(".personal-name").text(data[0].username);
        }, 
        error:function(data){
            alert("网页错误");
        }
    });
});

</script>
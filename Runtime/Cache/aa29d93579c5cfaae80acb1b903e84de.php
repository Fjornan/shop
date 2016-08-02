<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
<link rel="stylesheet" type="text/css" href="../Public/css/style.css">
<link href="../Public/css/bootstrap.min.css" rel="stylesheet">
<link href="../Public/css/swiper.min.css" rel="stylesheet">
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>	
<script src="../Public/js/swiper.jquery.min.js"></script>
<script src="../Public/js/common.js"></script>  
<title>家电商城</title>	

</head>

<body>
<!-------------------         顶部导航         -------------------->
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
    	<div class="input-group" style="top:7px">
        	<span class="input-group-addon glyphicon glyphicon-search" style="top:0px">
            </span>
        	<input type="text" class="form-control" placeholder="请输入您要搜索的商品">
            <span class="input-group-btn">
            	<button class="btn btn-default" id="goods-search">Go!</button>
            </span> 
        </div>
    </div>
</nav>
<!-----------------------------     swiper      -------------------------------->
<div class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide swiper-one"><span></span></div>
        <div class="swiper-slide swiper-two"><span></span></div>
        <div class="swiper-slide swiper-three"><span></span></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>

</div>
<div class="container">
    <ul class="index-list row list-unstyled text-center">
    	<li class="col-xs-3" id="list-all" title="goodslist" ><span></span><p>所有商品</p></li>
        <li class="col-xs-3" id="list-seckill" title="seckill"><span></span><p>极速秒杀</p></li>
        <li class="col-xs-3" id="list-coupon" title="coupon"><span></span><p>优惠领取</p></li>
        <li class="col-xs-3" id="list-message" title="storemessage"><span></span><p>门店信息</p></li>
    </ul>
</div>
<div style="background-color:#F7F7F7">
    <div class="container">
        <div class="hot-recommend">
            <h5><span></span>&nbsp;热门推荐：</h5>
            
            <div class="hot-goods row">
             <!--
                <div class="col-xs-6 hot-list-each">
                    <img src="../Public/image/goods/TV/2015010808785737.jpg" style="width:100%">
                    <div class="hot-goods-message">
                        <p class="hot-goods-name">正品小米超薄高清智能平板电视机Xiaomi/小米 小米电视3S 43英寸</p>
                        <p style="float:left; color:#F00; font-size:12px">热销价 :￥</p><p class="hot-goods-price">1899.00</p>
                    </div>
                    
                </div>
               
                <div class="col-xs-6 hot-list-each">
                	<img src="../Public/image/goods/washer/2015010705782248.jpg" style="width:100%">
                    
                    <p class="hot-goods-name">Haier/海尔EG7012B29W 7公斤 变频全自动 滚筒洗衣机 消毒洗
变频电机 静音洗 深度消毒洗 羽绒洗</p>
                    <p style="float:left; color:#F00; font-size:12px">热销价 :￥</p><p class="hot-goods-price">1899.00</p>
                </div>

                <div class="col-xs-6 hot-list-each">
                    <img src="../Public/image/goods/TV/2015010808785737.jpg" style="width:100%">
                    <div class="hot-goods-message">
                        <p class="hot-goods-name">正品小米超薄高清智能平板电视机Xiaomi/小米 小米电视3S 43英寸</p>
                        <p style="float:left; color:#F00; font-size:12px">热销价 :￥</p><p class="hot-goods-price">1899.00</p>
                    </div>
                </div>
                <div class="col-xs-6 hot-list-each">
                	<img src="../Public/image/goods/washer/2015010705782248.jpg" style="width:100%">
                    
                    <p class="hot-goods-name">Haier/海尔EG7012B29W 7公斤 变频全自动 滚筒洗衣机 消毒洗
变频电机 静音洗 深度消毒洗 羽绒洗</p>
                    <p style="float:left; color:#F00; font-size:12px">热销价 :￥</p><p class="hot-goods-price">1899.00</p>
                </div>
                -->
            </div>
            <div class="hot-recommend-bottom"></div>
        </div>
    </div>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">
    	<ul class="row list-unstyled index-bottom">
			<li id="index" class="col-xs-3 bottom-active"><span class="glyphicon glyphicon-home"></span><p>首页</p></li>
            <li id="goodslist" class="col-xs-3"><span class="glyphicon glyphicon-th-list"></span><p>所有商品</p></li>
            <li id="shoppingcart" class="col-xs-3"><span class="glyphicon glyphicon-shopping-cart"></span><p>购物车</p></li>
            <li id="personal.Tpl" class="col-xs-3"><span class="glyphicon glyphicon-user"></span><p>会员中心</p></li>
        </div>
    </div>
</nav>
</body>
</html>
<script>
//滑动设置
var swiper = new Swiper('.swiper-container', {
    pagination: '.swiper-pagination',
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    paginationClickable: true,
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: 2500,
    autoplayDisableOnInteraction: false
});
//底部导航页面跳转
$(".index-bottom li").click(function(e) {
   var winname = $(this).attr("id");
   window.location.href= SHOP +'/Display/'+winname;
});
//中层列表页面跳转
$(".index-list li").click(function(e) {
   var winname = $(this).attr("title");
   window.location.href= SHOP +'/Display/'+winname;
});
//热门推荐获取
$(function(){
    $.ajax({
        type: "post",  
        url: SHOP + "/Index/hotRecommend",  
        dataType: "json",   
        success: function(data){    
            for(var i in data){
                var obj = '<div class="col-xs-6 hot-list-each"><p class="goods_id" style="display:none">'+data[i].goods_id+'</p><img class="hot-goods-pic" src="'+SHOP+'/Tpl/'+data[i].goods_pic+'" style="width:100%"><p class="hot-goods-name">'+data[i].goods_name+'</p><p style="float:left; color:#F00; font-size:12px">热销价 :￥</p><p class="hot-goods-price">'+data[i].goods_price+'</p></div>';
                $(".hot-goods").append(obj);   
            }
            // $(".hot-recommend").listview('refresh');
            // $(".hot-recommend").trigger("create"); 
        }, 
        error:function(data){
            alert("网页错误");
        }
    });
});
//点击商品，跳转商品详情页面
$(".hot-recommend").on("click",".hot-goods-pic,.hot-goods-name",function(e){
    var goods_id = $(this).parent().find('.goods_id').text();
    window.location.href= SHOP +'/Display/goodsDetail?goods_id='+goods_id;
});
</script>
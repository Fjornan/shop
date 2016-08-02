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
<title>我的卡券</title>

</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container text-center">

        <span class="head-title">我的卡券</span  >

    </div>
</nav>
<div class="container mycoupon-contain">
<!--     <div class="mycoupon-list">
        <span style="display:none" class="coupon-id">1</span>
        <div class="coupon-content text-center">
            <span class="coupon-pic"></span><span class="coupon-detail">满100减5元</span>
        </div>
        <p class="coupon-note"><span>失效时间：</span><span class="coupon-deadline">2016-12-31 23:59:59</span></p>
    </div> -->
</div>

</body>
</html>

<script>
//页面跳转
function winTo(winname){
    window.location.href=SHOP+'/Display/'+winname;
}
$(function(){
    //调整界面高度
    $('.mycoupon-contain').css('height',$(window).height()-50);
    //获取我的卡券信息
    $.ajax({
        type:"post",
        url:SHOP+"/Personal/getMyCoupon",
        dataType:"json",
        async:"true",
        success: function(data){
            for(var i in data){
                var obj = '<div class="mycoupon-list">        <span style="display:none" class="id">'+data[i].id+'</span>        <div class="coupon-content text-center">            <span class="coupon-pic"></span><span class="coupon-detail">'+data[i].coupon_detail+'</span>        </div>        <p class="coupon-note"><span>失效时间：</span><span class="coupon-deadline">'+data[i].coupon_deadline+'</span></p>    </div>';
                $('.mycoupon-contain').append(obj);
            }
        },
        error: function(data){
            alert("网页错误");
        }
    })
})
</script>
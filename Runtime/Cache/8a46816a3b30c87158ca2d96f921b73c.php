<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
<link href="../Public/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../Public/css/style.css" rel="stylesheet" type="text/css" >
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>   
<script src="../Public/js/swiper.jquery.min.js"></script>
<script src="../Public/js/common.js"></script>  
<title>确认订单</title>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container text-center">
        <span class="glyphicon glyphicon-menu-left winback" onClick="winTo('shoppingcart')"></span>
        <span class="head-title">确认订单</span  >
        <span>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
</nav>
<div class="orderconfirm-contain contain-margin-top">
    <div class="mid-blur"></div>
    <div class="shipping-address">
        
    </div>
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
    $('.orderconfirm-contain').css('height',$(window).height()-50);
    //获取我的卡券信息
    $.ajax({
        type: "post",  
        url: SHOP + "/Order/orderConfirm",  
        dataType: "json",   
        success: function(data){    

        }, 
        error:function(data){
            alert('获取失败');
        }
    });
})
</script>
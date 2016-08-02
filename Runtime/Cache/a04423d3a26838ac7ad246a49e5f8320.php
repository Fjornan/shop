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
<title>我的订单</title>

</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container text-center">
        <span class="glyphicon glyphicon-menu-left winback" onClick="winTo('personal')"></span>
        <span class="head-title">我的订单</span  >
        <span>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</span>
    </div>
</nav>
<div class="container myorder-contain padding-none contain-margin-top">
    <!-- <div class="mid-blur"></div>
    <div class="myorder-list">
        <div class="order-title">
            <span>订单编号:</span>
            <span class="order-id">2016061120000384</span>
            <span class="order-status">代付款</span>
        </div>
        <div class="small-blur" style="background-color:#ccc;"></div>
        <div class="order-content">
            <div class="order-goods-name">正品小米超薄高清智能平板电视机Xiaomi/小米 小米电视3S</div><span>等</span><span class="order-buy-amount">2</span><span>件商品</span>
            <div class="order-shipping-contacts">冯嘉楠</div>
            <div class="order-shipping-address">浙江省杭州市西湖区文三路140号浙江外国语学院</div>
        </div>
    </div> -->
</div>

</body>
</html>

<script>
var order_status = "<?php echo ($order_status); ?>";
//页面跳转
function winTo(winname){
    window.location.href=SHOP+'/Display/'+winname;
}
$(function(){
    //调整界面高度
    $('.myorder-contain').css('height',$(window).height()-50);
    //获取我的订单信息
    $.ajax({
        type:"post",
        url:SHOP+"/Personal/getMyOrder",
        dataType:"json",
        async:"true",
        data:{
            order_status:order_status,
        },
        success: function(data){
            for(var i in data){
                var obj = '<div class="mid-blur"></div>    <div class="myorder-list" onClick="">        <div class="order-title">            <span>订单编号:</span>            <span class="order-id">'+data[i].order_id+'</span>            <span class="order-status">'+orderStatus(data[i].order_status,data[i].isdelivery)+'</span>        </div>        <div class="small-blur" style="background-color:#ccc;"></div>        <div class="order-content">            <div class="order-goods-name">'+data[i].goods_name+'</div><span>等</span><span class="order-buy-amount">'+data[i].buy_amount+'</span><span>件商品</span>            <div class="order-shipping-contacts">'+data[i].shipping_contacts+'</div>            <div class="order-shipping-address">'+data[i].shipping_address+'</div>        </div>    </div>';
            $('.myorder-contain').append(obj);
            }
            
        },
        error: function(data){
            alert("网页错误");
        }
    })
})

//状态选择
function orderStatus(order_status,isdelivery){
    if(order_status == 1){
        return '待付款';
    }else if(order_status == 3){
        return '已完成';
    }else if(order_status == 2 && isdelivery == 1){
        return '待发货';
    }else if(order_status == 2 && isdelivery == 2){
        return '待确认收货';
    }
}

$('.myorder-contain').on('click','.myorder-list',function(){
    var order_id = $(this).find('.order-id').text();
    window.location.href=SHOP+'/Display/orderdetail?order_id='+order_id;
})

</script>
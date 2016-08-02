<!DOCTYPE html>

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
<title>订单详情</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container text-center">
        <span class="head-title">订单详情</span>
    </div>
</nav>
<div class="container orderdetail-contain padding-none contain-margin-top">
    <!-- <div class="shcart-list-contain row  padding-none margin-none">
        <div class="col-xs-4 shcart-goods-pic padding-none">
            <img src="../Public/image/goods/1/2015010808785737.jpg" style="width:100%">
        </div>
        <div class="col-xs-8 shcart-goods-content container">
            <p class="goods_id"></p>
            <div class="shcart-list-name">
            <span class="goods_name">正品小米超薄高清智能平板电视机Xiaomi/小米 小米电视3S 43英寸</span>
            </div>
            <div class="shcart-list-price">
                <span>￥</span><span class="goods_price">1899.00</span>
            </div>
            <div class="shcart-list-amount">
                <span>购买数量 ×</span>
                <div style="float:right; margin-right:80px;">
                    <span class="buy-amount">123</span>
                </div>
            </div>
        </div>
    </div> -->

</div>


</body>
</html>

<script>
var order_id = "<{$order_id}>";
//页面跳转
function winTo(winname){
    window.location.href=SHOP+'/Display/'+winname;
}
$(function(){
    //调整界面高度
    $('.orderdetail-contain').css('height',$(window).height()-50);
    //获取订单详情
    $.ajax({
        type:"post",
        url:SHOP+"/Order/getOrderDetail",
        dataType:"json",
        async:"true",
        data:{
            order_id:order_id,
        },
        success: function(data){
            for(var i in data){
                obj = '<div class="shcart-list-contain row  padding-none margin-none">        <div class="col-xs-4 shcart-goods-pic padding-none">            <img src="'+SHOP+'/Tpl/'+data[i].goods_pic+'" style="width:100%">        </div>        <div class="col-xs-8 shcart-goods-content container">            <p class="goods_id"></p>            <div class="shcart-list-name">            <span class="goods_name">'+data[i].goods_name+'</span>            </div>            <div class="shcart-list-price">                <span>￥</span><span class="goods_price">'+data[i].goods_price+'</span>            </div>            <div class="shcart-list-amount">                <span>购买数量 ×</span>                <div style="float:right; margin-right:80px;">                    <span class="buy-amount">'+data[i].buy_amount+'</span>                </div>            </div>        </div>    </div>';
                $('.orderdetail-contain').append(obj);
            }
            //添加底部栏
            if(data[0].order_status == 1){
                //待付款底部
                obj = '<nav class="navbar navbar-default navbar-fixed-bottom" style="display:">    <div class="container order-detail-bottom">        <div class="row">            <div class="col-xs-3 padding-none col-xs-offset-6 text-center cancel-order" onclick="">取消订单</div>            <div class="col-xs-3 padding-none text-center pay-order" onclick="">去付款</div>        </div>    </div></nav>';
                $('body').append(obj);
            }else if(data[0].order_status == 2 && data[0].isdelivery == 2){
                //待确认收货底部
                obj = '<nav class="navbar navbar-default navbar-fixed-bottom" style="display:">    <div class="container order-detail-bottom">        <div class="row">                <div class="col-xs-12 padding-none text-center confirm-receive" onclick="">确认收货</div>        </div>    </div></nav>';
                $('body').append(obj);
            }
                        
        },
        error: function(data){
            alert("网页错误");
        }
    })
})
//去付款
$('body').on('click','.pay-order',function(){
    window.location.href=SHOP+'/Display/payment?order_id='+order_id;
})
//取消订单
$('body').on('click','.cancel-order',function(){
    $.ajax({
        type: "post",  
        url: SHOP + "/Order/cancelOrder",  
        dataType: "json",
        data:{
            order_id:order_id,
        },
        success: function(data){    
            window.location.href=SHOP+'/Display/myorder?status=1';
        }, 
        error:function(data){
            alert('获取失败');
        }
    });
})
//确认收货
$('body').on('click','.confirm-receive',function(){
    $.ajax({
        type: "post",  
        url: SHOP + "/Order/confirmReceive",  
        dataType: "json",
        data:{
            order_id:order_id,
        },
        success: function(data){    
            window.location.href=SHOP+'/Display/myorder?status=3';
        }, 
        error:function(data){
            alert('获取失败');
        }
    });
})
</script>

<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
<link href="../Public/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../Public/css/style.css" rel="stylesheet" type="text/css" >
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>   
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
    <div class="shipping-contain container padding-none">
        <div class="col-xs-11 padding-none">
            <p><span>联系人：　</span><span class="shipping-contacts"></span></p>
            <p><span>收件地址：</span><span class="shipping-address"></span></p>
            <p><span>联系号码：</span><span class="shipping-mobile"></span></p>
        </div>
        <div class="col-xs-1 padding-none">
            <span class="glyphicon glyphicon-menu-right choose-address"></span>
        </div>
    </div>
    <div class="mid-blur"></div>
    <div class="shoppingcart-goods">
        <!-- <div class="shcart-list-contain row  padding-none margin-none">
            <div class="col-xs-4 shcart-goods-pic padding-none">
                <img src="../Public/image/goods/TV/2015010808785737.jpg" style="width:100%">
            </div>
            <div class="col-xs-8 shcart-goods-content container">
                <p class="goods_id"></p>
                <div class="shcart-list-name">
                <span class="goods_name">正品小米超薄高清智能平板电视机Xiaomi/小米 小米电视3S 43英寸</span>
                </div>
                <div class="shcart-list-price" style="float:left">
                    <span>￥</span><span class="goods_price">1899.00</span>
                </div>
                <div class="shcart-list-amount" style="float:right">
                    <span>×</span><span class="goods_amount"></span>
                </div>
            </div>
        </div>
        <div class="mid-blur" style="background-color: #eee"></div> -->
    </div>
    <div class="use-coupon"></div>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container orderconfirm-bottom">
        <div class="row">
            <div class="col-xs-4 padding-none col-xs-offset-5 text-center"><span>合计￥</span><span class="sumprice"></span></div>
            <div class="col-xs-3 padding-none text-center generate-order">确认下单</div>
        </div>
    </div>
</nav>
<!-- 选择联系人 -->
<div class="modal fade" id="chooseShippingModal" tabindex="-1" aria-labelledby="chooseShippingModalLabel" aria-hidden="true" style="top: 15%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="chooseShippingModalLabel" style="text-align: center;font-size: 24px;">
               选择收件人信息
            </h4>
            <div class="myaddress-contain" style="margin-top:10px;">
                
            </div>
            <p class="delete-order-id text-center"></p>
         </div>
         <div class="modal-footer" style="border-top: 0px;text-align: center;">
            <button type="button" class="btn btn-primary add-new-address"  data-dismiss="modal" >添加新地址
            </button>
            <button type="button" class="btn btn-primary" data-dismiss="modal">取消
            </button>
         </div>
      </div>
    </div>
</div>
<!-- /.modal -->
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
            $('.sumprice').text(data.sumprice);
            $('.shipping-contacts').text(data.contacts);
            $('.shipping-address').text(data.address);
            $('.shipping-mobile').text(data.mobile);
            for(i=0;i<data.row.length;i++){
                var obj = '<div class="shcart-list-contain row  padding-none margin-none">            <div class="col-xs-4 shcart-goods-pic padding-none">                <img src="'+SHOP+'/Tpl/'+data.row[i].goods_pic+'" style="width:100%">            </div>            <div class="col-xs-8 shcart-goods-content container">                <p class="goods_id"></p>                <div class="shcart-list-name">                <span class="goods_name">'+data.row[i].goods_name+'</span>                </div>                <div class="shcart-list-price" style="float:left">                    <span>￥</span><span class="goods_price">'+data.row[i].goods_price+'</span>                </div>                <div class="shcart-list-amount" style="float:right">                    <span>×</span><span class="goods_amount">'+data.row[i].amount+'</span>                </div>            </div>        </div>        ';
                $('.shoppingcart-goods').append(obj);    
            }
        }, 
        error:function(data){
            alert('获取失败');
        }
    });
})
//下单并跳转支付页面
$('.generate-order').click(function(){
    $.ajax({
        type: "post",  
        url: SHOP + "/Order/generateOrder",  
        dataType: "json",
        data:{
            shipping_contacts:$('.shipping-contacts').text(),
            shipping_address:$('.shipping-address').text(),
            shipping_mobile:$('.shipping-mobile').text(),
        },   
        success: function(data){    
           window.location.href=SHOP+'/Display/payment?order_id='+data.order_id;
        }, 
        error:function(data){
            alert('获取失败');
        }
    });
})
//弹出收件人选择框
$('.shipping-contain').click(function(){
    $.ajax({
        type: "post",  
        url: SHOP + "/Personal/getMyAddress",  
        dataType: "json",
        success: function(data){
            $('.myaddress-contain').children().remove();
            for(var i in data){
                var obj = '<div class="myaddress-list container" onClick="">                    <div class="row">                        <div class="col-xs-10 myaddress-left">                            <p class="myaddress-address">                      <span class="myaddress-detail">'+data[i].address_area+data[i].address_detail+'</span>                            </p>                            <p><span class="myaddress-contacts">'+data[i].contacts+'</span>&nbsp;&nbsp;&nbsp;<span class="myaddress-mobile">'+data[i].mobile+'</span></p>                        </div>                        <div class="col-xs-2 myaddress-right">                            <span class="glyphicon glyphicon-menu-right address-edit"></span>                        </div>                    </div>                </div>';
                $('.myaddress-contain').append(obj);
            }
        }, 
        error:function(data){
            alert('获取失败');
        }
    });
    $('#chooseShippingModal').modal('toggle');
})
//选择收件人
$('.myaddress-contain').on('click','.myaddress-list',function(){
    var shipping_mobile = $(this).find('.myaddress-mobile').text();
    var shipping_address = $(this).find('.myaddress-detail').text();
    var shipping_contacts = $(this).find('.myaddress-contacts').text();
    $('.shipping-mobile').text(shipping_mobile) ;
    $('.shipping-contacts').text(shipping_contacts);
    $('.shipping-address').text(shipping_address);
    $('#chooseShippingModal').modal('hide');
})
//添加新地址

$('.add-new-address').click(function(){
    winTo('addressEdit');
})
</script>

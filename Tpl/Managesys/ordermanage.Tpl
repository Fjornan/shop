<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>家电商城后台管理</title>
<link href="../Public/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../Public/css/managesys.css" rel="stylesheet" type="text/css" >
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>   
<script src="../Public/js/common.js"></script>  
<style>

</style>
</head>

<div class="padding-none base-background">
<div class="order-contain">
    <div class="order-list-head list-unstyled">
        <li style="width:200px">订单编号</li>
        <li style="width:120px">下单会员</li>
        <li style="width:120px">商品详情</li>
        <li style="width:120px">收件人</li>
        <li style="width:300px">收件地址</li>
        <li style="width:200px">下单时间</li>
        <li style="width:120px">订单状态</li>
        <li style="width:185px">操作</li>
    </div>
<!--     <div class="order-list-contain list-unstyled">
        <li style="width:200px">订单编号</li>
        <li style="width:120px">下单用户</li>
        <li style="width:120px"><button type="button" class="btn btn-success"><span class="glyphicon glyphicon-search"></span><span>查看</span></button></li>
        <li style="width:120px">收件人</li>
        <li style="width:300px">收件地址</li>
        <li style="width:200px">下单时间</li>
        <li style="width:120px">订单状态</li>
        <li style="width:185px"><button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span><span>删除订单</span></button></li>
    </div> -->
</div>
</div>
<!-- 确认发货提示框 -->
<div class="modal fade" id="testModal" tabindex="-1" aria-labelledby="testModalLabel" aria-hidden="true" style="top: 15%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="testModalLabel" style="text-align: center;font-size: 24px;">
               确认发货？
            </h4><br>
         </div>
         <div class="modal-footer" style="border-top: 0px;text-align: center;">
            <button type="button" class="btn btn-primary"  data-dismiss="modal" >确认
            </button>
            <button type="button" class="btn btn-primary" data-dismiss="modal">取消
            </button>
         </div>
      </div>
    </div>
</div>
<!-- /.modal -->
<!-- 删除订单提示框 -->
<div class="modal fade" id="deleteOrderModal" tabindex="-1" aria-labelledby="deleteOrderModalLabel" aria-hidden="true" style="top: 15%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="deleteOrderModalLabel" style="text-align: center;font-size: 24px;">
               确认删除该订单
            </h4><br>
            <p class="delete-order-id text-center"></p>
         </div>
         <div class="modal-footer" style="border-top: 0px;text-align: center;">
            <button type="button" class="btn btn-primary delete-order-confirm"  data-dismiss="modal" >确认
            </button>
            <button type="button" class="btn btn-primary" data-dismiss="modal">取消
            </button>
         </div>
      </div>
    </div>
</div>
<!-- /.modal -->
<!-- 显示下单商品提示框 -->
<div class="modal fade" id="showGoodsModal" tabindex="-1" aria-labelledby="showGoodsModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="showGoodsModalLabel" style="text-align: center;font-size: 24px;">
               下单商品
            </h4><br>
            <p style="display:none" class="show-goods-order"></p>
            <div class="order-goods-contain" style="width:100%; height:300px">
                 <div class="order-goods-list" style="border-bottom: 1px #ccc solid;">
                     <img class="order-goods-pic" style="width:100px; height:80px display:block; float:left; margin-right:10px" src="../Public/image/goods/1/2015010808785737.jpg">
                     <div class="order-goods-detail">
                     	<p class="order-goods-name">正品小米超薄高清智能平板电视机Xiaomi/小米 小米电视3S</p>
                        <p><span style="font-size:12px; color:#666;">商品编号:　</span><span class="order-goods-id">203423421232343</span></p>
                        <p><span style="font-size:12px; color:#666;">购买数量　×　</span><span class="order-goods-amount"></span></p>
                     </div>
                 </div>
            </div>
         </div>
         <div class="modal-footer" style="border-top: 0px;text-align: center; display:block">
            <button type="button" class="btn btn-primary add-ass-confirm"  data-dismiss="modal" >确认
            </button>

         </div>
      </div>
    </div>
</div>
<!-- /.modal -->
<!-- 添加商品分类提示框 -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 15%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel" style="text-align: center;font-size: 24px;">
               添加分类
            </h4><br>
            <input type="text" class="form-control ass-name" placeholder="请输入要添加的分类名称">
         </div>
         <div class="modal-footer" style="border-top: 0px;text-align: center;">
            <button type="button" class="btn btn-primary add-ass-confirm"  data-dismiss="modal" >确认
            </button>
            <button type="button" class="btn btn-primary" data-dismiss="modal">取消
            </button>
         </div>
      </div>
    </div>
</div>
<!-- /.modal -->


</html>
<script>
//页面跳转
function winTo(winname){
    window.location.href=SHOP+'/Display/'+winname;
}
var order_status = "<{$order_status}>";
var isdelivery = "<{$isdelivery}>";

//初始化页面
$(function(){
    //设定页面高度
    $(".base-background").css('height',$(window).height());

    $.ajax({
        type:"post",
        url:SHOP+"/Managesys/getOrder",
        dataType:"json",
        data:{
            order_status:order_status,
            isdelivery:isdelivery,
        },
        async:"true",
        success: function(data){
            for(var i in data){
                obj = '<div class="order-list-contain list-unstyled">        <li style="width:200px" class="order-id">'+data[i].order_id+'</li>        <li style="width:120px" title="用户id号：'+data[i].loginkey+'">'+data[i].username+'</li>        <li style="width:120px"><button type="button" class="btn btn-success look-goods"><span class="glyphicon glyphicon-search"></span><span>查看</span></button></li>        <li style="width:120px">'+data[i].shipping_contacts+'</li>        <li style="width:300px" title="'+data[i].shipping_address+'">'+data[i].shipping_address+'</li>        <li style="width:200px">'+data[i].order_begin+'</li>        <li style="width:120px"><button type="button" class="btn btn-warning"><span>'+orderStatus(data[i].order_status,data[i].isdelivery)+'</span></button></li>        <li class="order-operate" style="width:185px"><button type="button" class="btn btn-danger delete-order"><span class="glyphicon     "></span><span>删除订单</span></button></li>    </div>';
                $('.order-contain').append(obj);
            }
            if(isdelivery == 1){
                $('.order-operate button').addClass('confirm-shipment');
                $('.order-operate button').removeClass('delete-order');
                $('.order-operate button span:nth-child(2)').text('确认发货');
                $('.order-operate button span:first-child').addClass('glyphicon-ok');
                $('.order-operate button span:first-child').removeClass('glyphicon-remove');
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
//查看订单商品
$('.order-contain').on('click','.look-goods',function(){
    var order_id = $(this).parent().parent().find('.order-id').text();
    $('.show-goods-order').text(order_id);
    $.ajax({
        type:"post",
        url:SHOP+"/Managesys/getOrderGoods",
        dataType:"json",
        data:{
            order_id:order_id,
        },
        async:"true",
        success: function(data){
            $('.order-goods-contain').children().remove();
            for(var i in data){
                obj = '<div class="order-goods-list" style="border-bottom:#ccc solid 1px; padding-bottom:5px">                     <img class="order-goods-pic" style="width:100px; height:80px display:block; float:left; margin-right:10px" src="'+SHOP+'/Tpl/'+data[i].goods_pic+'">                     <div class="order-goods-detail">                        <p class="order-goods-name">'+data[i].goods_name+'</p>                        <p><span style="font-size:12px'+data[i].goods_name+'; color:#666;">商品编号:　</span><span class="order-goods-id">'+data[i].goods_id+'</span></p>                        <p><span style="font-size:12px; color:#666;">购买数量　×　</span><span class="order-goods-amount">'+data[i].buy_amount+'</span></p>                     </div>                 </div> ';
                $('.order-goods-contain').append(obj);
            }
        },
        error: function(data){
            alert("网页错误");
        }
    })  
    $('#showGoodsModal').modal('toggle');
});
//点击删除订单
$('.order-contain').on('click','.delete-order',function(){
    var order_id = $(this).parent().parent().find('.order-id').text();
    var obj = $(this).parent().parent();
    $('.delete-order-id').text(order_id);
    $('#deleteOrderModal').modal('toggle');
})
//确认删除订单
$('.delete-order-confirm').click(function(){
    var order_id = $(this).parent().parent().find('.delete-order-id').text();
    var obj = $(".order-id:contains("+order_id+")").parent();
    $.ajax({
        type:"post",
        url:SHOP+"/Managesys/deleteOrder",
        dataType:"json",
        data:{
            order_id:order_id,
        },
        async:"true",
        success: function(data){
            obj.remove();
        },
        error: function(data){
            alert("网页错误");
        }
    })  
});
//确认更改订单状态
$('.order-contain').on('click','.confirm-shipment',function(){
    var order_id = $(this).parent().parent().find('.order-id').text();
    var obj = $(".order-id:contains("+order_id+")").parent();
    // $('#testModal').modal('toggle');
    $.ajax({
        type:"post",
        url:SHOP+"/Managesys/changeOrderStatus",
        dataType:"json",
        data:{
            order_id:order_id,
        },
        async:"true",
        success: function(data){
            if(data.status == 1){
                obj.remove();
            }
            
        },
        error: function(data){
            alert("网页错误");
        }
    })  
})
</script>

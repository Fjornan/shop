<!DOCTYPE html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
<link href="../Public/css/bootstrap.min.css" rel="stylesheet">
<link href="../Public/css/swiper.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../Public/css/style.css">
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>	
<script src="../Public/js/common.js"></script>   
<script src="../Public/js/swiper.jquery.min.js"></script>
<title>购物车</title>
</head>
<style>
    .modal-content{
        font-family:"Microsoft YaHei UI"
    }
</style>
<body>

<!---         顶部导航         -->
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container text-center">
    	<span class="head-title">购物车</span>
    </div>
</nav>
<div class="shcart-contain container-fluid padding-none">
    <!-- <div class="shcart-list-contain row  padding-none margin-none">
    	<div class="col-xs-4 shcart-goods-pic padding-none">
    		<img src="../Public/image/goods/TV/2015010808785737.jpg" style="width:100%">
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
            	<span>购买数量</span>
                <div class="shcart-change-amount">
                	<span class="shcart-list-minus"></span>
                    <span class="shcart_goods_amount">123</span>
                    <span class="shcart-list-plus"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="mid-blur" style="background-color: #eee"></div> -->
</div>
<nav class="navbar navbar-default navbar-fixed-bottom shcart-operate" style="margin-bottom: 60px; background-color: #eee">
    <div class="container padding-none">
        <ul class="row list-unstyled text-center margin-none">
            <li class="col-xs-3 padding-none shcart-clear-all">全部清空</li>
            <li class="col-xs-6 padding-none shcart-all-price-contain">
                <span>合计￥</span><span class="shcart-all-price">0</span>
            </li>
            <li class="col-xs-3 padding-none shcart-account" onclick="winTo('orderconfirm')">去结算</li>
        </ul>
    </div>
</nav>
<nav class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">
    	<ul class="row list-unstyled index-bottom">
			<li id="index" class="col-xs-3"><span class="glyphicon glyphicon-home"></span><p>首页</p></li>
            <li id="goodslist" class="col-xs-3"><span class="glyphicon glyphicon-th-list"></span><p>所有商品</p></li>
            <li id="shoppingcart" class="col-xs-3 bottom-active"><span class="glyphicon glyphicon-shopping-cart"></span><p>购物车</p></li>
            <li id="personal.Tpl" class="col-xs-3"><span class="glyphicon glyphicon-user"></span><p>会员中心</p></li>
        </ul>
    </div>
</nav>


<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" style="top: 35%">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <p class="delete_goods_id" style="display: none"></p>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="deleteModalLabel"  style="text-align: center;font-size: 24px;">将该商品从购物车中删除？</h4>
      </div>
      <div class="modal-footer" style="border-top: 0px;text-align: center;">
        <button type="button" class="btn btn-primary delete-goods" data-dismiss="modal">确定</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- 提示框 -->
<!-- 提示框 -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 35%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel" style="text-align: center;font-size: 24px;">
               将该商品库存不足？
            </h4>
         </div>
         <div class="modal-footer" style="border-top: 0px;text-align: center;">
            <button type="button" class="btn btn-primary" 
               data-dismiss="modal">确认
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->

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
//获取购物车信息
$(function(){
    $.ajax({
        type: "post",  
        url: SHOP + "/ShoppingCart/getShoppingcart",  
        dataType: "json",   
        success: function(data){    
            for(i=0;i<data.row.length;i++){
                var obj = '<div class="shcart-list-contain row  padding-none margin-none">        <div class="col-xs-4 shcart-goods-pic padding-none">            <img src="'+SHOP+'/Tpl/'+data.row[i].goods_pic+'" style="width:100%">        </div>        <div class="col-xs-8 shcart-goods-content container"> <p class="goods_id" title="'+data.row[i].goods_id+'"">'+data.row[i].goods_id+'</p>            <div class="shcart-list-name">            <span class="goods_name">'+data.row[i].goods_name+'</span>            </div>            <div class="shcart-list-price">                <span>￥</span><span class="goods_price">'+data.row[i].goods_price+'</span>            </div>            <div class="shcart-list-amount">                <span>购买数量</span>                <div class="shcart-change-amount">                    <span class="shcart-list-minus"></span>                    <span class="shcart_goods_amount">'+data.row[i].amount+'</span>                    <span class="shcart-list-plus"></span>                </div>            </div>        </div>    </div>';
                $('.shcart-contain').append(obj);
            }
            $('.shcart-all-price').text(data.sumprice);
        }, 
        error:function(data){
            $('#myModalLabel').text('获取失败');
            $('#myModal').modal('toggle');
        }
    });
});
//点击商品跳转商品详情页面
$(".shcart-contain").on("click",".shcart-goods-pic,.shcart-list-name",function(e){
    var goods_id = $(this).parent().find('.goods_id').text();
    window.location.href= SHOP +'/Display/goodsDetail?goods_id='+goods_id;
});
//购买数量+1
$(".shcart-contain").on("click",".shcart-list-plus",function(e){
    var goods_id = $(this).parent().parent().parent().parent().find('.goods_id').text();
    var amount = $(this).parent().find('.shcart_goods_amount');
     $.ajax({
        type: "post",  
        url: SHOP + "/ShoppingCart/changeGoodsAmount",  
        dataType: "json",   
        data:{
            goods_id:goods_id,
            type:1,
        },
        success: function(data){    
            if(data.status==1){
                amount.text(parseInt(amount.text())+1);
                $('.shcart-all-price').text(data.sumprice);
            }else if(data.status == 2){
                $('#myModalLabel').text('商品库存不足');
                $('#myModal').modal('toggle');
            }
            
        }, 
        error:function(data){
            $('#myModalLabel').text('添加失败');
            $('#myModal').modal('toggle');
        }
    });
});
//购买数量-1
$(".shcart-contain").on("click",".shcart-list-minus",function(e){
    var goods_id = $(this).parent().parent().parent().parent().find('.goods_id').text();
    var amount = $(this).parent().find('.shcart_goods_amount');
    if(amount.text() == 1){
        $('#deleteModalLabel').text('将该商品从购物车中删除？');
        $('#deleteModal').modal('toggle');
        $('.delete_goods_id').text(goods_id);
        $('.delete_id').text(delete_id);
        $('.delete_id').attr('title',delete_id);
    }else{
        $.ajax({
        type: "post",  
        url: SHOP + "/ShoppingCart/changeGoodsAmount",  
        dataType: "json",
        data:{
            goods_id:goods_id,
            type:2,
        },
        success: function(data){
            if(data.status==1){
                amount.text(parseInt(amount.text())-1);
                $('.shcart-all-price').text(data.sumprice);
            }            
        }, 
        error:function(data){
            $('#myModalLabel').text('删减失败');
            $('#myModal').modal('toggle');
        }
    });
    }
     
});
//清除商品
//type:1 清除单个 type：2清除所有
$('.delete-goods').click(function(){
    var goods_id = $(this).parent().parent().find('.delete_goods_id').text();
    var delete_id = $(this).parent().parent().find('.delete_id').text();
    $.ajax({
        type: "post",  
        url: SHOP + "/ShoppingCart/deleteGoods",  
        dataType: "json",   
        data:{
            goods_id:goods_id,
            type:1,
        },
        success: function(data){
            if(data.status == 1){
                //$('.shcart-contain').find('.shcart-list-contain').eq(delete_id).remove();
                $("[title="+goods_id+"]").parent().parent().remove();
                $('.shcart-all-price').text(data.sumprice);
            }
            
        }, 
        error:function(data){
            $('#myModalLabel').text('删除失败');
            $('#myModal').modal('toggle');
        }
    });
})
//清空购物车内所有物品
$('.shcart-clear-all').click(function(){
    var goods_id = $(this).parent().parent().find('.delete_goods_id').text();
    var delete_id = $(this).parent().parent().find('.delete_id').text();

    $.ajax({
        type: "post",  
        url: SHOP + "/ShoppingCart/deleteGoods",  
        dataType: "json",   
        data:{
            goods_id:'all',
            type:2,
        },
        success: function(data){
            if(data.status == 1){
                $('.shcart-contain').children().remove();
                $('.shcart-all-price').text(data.sumprice);
            }
            
        }, 
        error:function(data){
            $('#myModalLabel').text('删除失败');
            $('#myModal').modal('toggle');
        }
    });
})
</script>
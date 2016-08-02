<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
<link href="../Public/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../Public/css/style.css" rel="stylesheet" type="text/css" >
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>   
<script src="../Public/js/swiper.jquery.min.js"></script>
<script src="../Public/js/common.js"></script>  
<title></title>
<style type="text/css">
    .modal-content{
        font-family:"Microsoft YaHei UI"
    }
</style>
</head>

<body>

<!-- <nav class="navbar navbar-default navbar-fixed-top">
	<div class="container row">
    	<div class="col-xs-12 back-to-goodslist">
        	<span class="glyphicon glyphicon-menu-left" onClick="winTo('goodslist')">&nbsp;
            </span>
            <span class="glyphicon glyphicon-option-horizontal" style="float:right"></span>
        </div>
    </div>
</nav> -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container text-center">
        <span class="head-title">商品详情</span  >
    </div>
</nav>
<div class="container goodsdetail-container">
	<div class="detail-goods-pic">
		<img id="good_pic" src="../Public/image/goods-blank-w.jpg" style="width:100%;">
    </div>
    <div class="detail-goods-content">
        <h4 id="goods_name" class="detail-goods-name"></h4>
        <div class="detail-goods-price">
            <span>￥</span>&nbsp;<p id="goods_price"></p>
        </div>
        <div style="margin-bottom:10px">
        	<span style="color:#999">好评度</span>&nbsp;<span>100%</span>
        </div>
        <div class="container" style="padding:0">
            <div class="detail-goods-sold"><span>销量</span>&nbsp;<p id="goods_sold"></p>&nbsp;<span>件</span></div>
            <div class="detail-goods-stock"><span>库存</span>&nbsp;<p id="goods_stock"></p>&nbsp;<span>件</span></div>
        </div>
    </div>
    <div class=" container">
    	<h5><strong>商品详情:</strong></h5>
        <p class="detail-instruction" id="goods_instruction"></p>
    </div>
</div>


<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
        <ul class="row list-unstyled goodsdetail-bottom text-center">
            <li class="col-xs-2" id="goodsCollect" onClick="goodsCollect()"><span class="glyphicon glyphicon-heart"></span><p>收藏</p></li>
            <li class="col-xs-2"><span class="glyphicon glyphicon-pencil"></span><p>评论</p></li>
            <li class="col-xs-2" onClick="winTo('mycoupon')"><span class="glyphicon glyphicon-credit-card"></span><p>卡券</p></li>
            <li class="col-xs-2" onClick="winTo('shoppingcart')"><span class="glyphicon glyphicon-shopping-cart"></span><p>购物车</p></li>
        	<li onclick="" class="col-xs-4 add-goods" style="top:0px;bottom:0px; ">加入购物车</li>
        </div>
    </div>
</nav>
<!-- 成功添加到购物车提示框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true" style="top: 35%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" style="border-bottom: 0px">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel" style="text-align: center;font-size: 24px;">
               已成功添加到购物车
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

var goods_id = "<{$goods_id}>";
//请求该商品的详情
$(function(){
    $.ajax({
        type:"post",
        url:SHOP+"/Goods/goodsDetail",
        dataType:"json",
        data:{
            goods_id:goods_id,
        },
        async:"true",
        success: function(data){
			$("#good_pic").attr("src",SHOP+'/Tpl/'+data[0].goods_pic)
            $("#goods_name").text(data[0].goods_name);
		    $("#goods_price").text(data[0].goods_price);	
		    $("#goods_sold").text(data[0].goods_sold);
			$("#goods_stock").text(data[0].goods_stock);
			$("#goods_instruction").text(data[0].goods_instruction);
            if(data.isfavorite == 1){
                $('#goodsCollect span').css('color','red');
            }
        },
        error: function(data){
            alert("网页错误");
        }
    })
})

//页面跳转
function winTo(winname){
	window.location.href=SHOP+'/Display/'+winname;
}

//点击添加到购物车
$(document).on("click",".add-goods",function(e){
    $.ajax({
        type:"post",
        url:SHOP+"/Goods/goodsAdd",
        dataType:"json",
        data:{
            goods_id:goods_id,
        },
        async:"true",
        success: function(data){
            if(data.status==1){
                $('#myModalLabel').text('已成功添加到购物车');
                $('#myModal').modal('toggle');
            }else if(data.status==2){
                $('#myModalLabel').text('购物车已存在该商品');
                $('#myModal').modal('toggle');
            }
           
        },
        error: function(data){
            alert("网页错误");
        }
    })
});
//跳转到购物车界面
function gotoShoppingcart(){
    window.location.href= SHOP +'/Display/shoppingcart';
}
//点击收藏
function goodsCollect(){
    $.ajax({
        type:"post",
        url:SHOP+"/Goods/goodsCollect",
        dataType:"json",
        data:{
            goods_id:goods_id,
        },
        async:"true",
        success: function(data){
            if(data.status==2){
                $('#goodsCollect span').css('color','red');
                $('#myModalLabel').text('收藏成功');
                $('#myModal').modal('toggle');
            }else if(data.status == 1){
                $('#goodsCollect span').css('color','#999');
                $('#myModalLabel').text('取消收藏');
                $('#myModal').modal('toggle');
            }else{
                $('#myModalLabel').text('操作失败');
                $('#myModal').modal('toggle');
            }
           
        },
        error: function(data){
            alert("网页错误");
        }
    })
}
</script>

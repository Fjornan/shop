<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
<link href="../Public/css/bootstrap.min.css" rel="stylesheet">
<link href="../Public/css/swiper.min.css" rel="stylesheet">
<link href="../Public/css/style.css" rel="stylesheet" type="text/css" >
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>   
<script src="../Public/js/swiper.jquery.min.js"></script>
<script src="../Public/js/common.js"></script>  
<title>所有商品</title>
<style type="text/css">
    .modal-content{
        font-family:"Microsoft YaHei UI"
    }
</style>

</head>

<body>

<!--         顶部导航         -->
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

<!--                     goods-list                      -->
<div class="container" style="margin-top:50px; padding:0px;margin-bottom: 50px;">
    <div class="row" style="margin-left: 0px;margin-right: 0px">
        <ul class="col-xs-3 goodslist-left list-unstyled text-center">
            <!-- <li title="1">电视</li>	
            <li title="2">冰箱</li>
            <li title="3">洗衣机</li>
            <li title="4">空调</li>   
            <li title="5">厨房大电</li>
            <li title="6">热水器</li> -->
        </ul>
        <ul class="col-xs-9 goodslist-right row padding-none list-unstyled" style="overflow: scroll;">
            <!-- <li class="col-xs-12 list-container padding-none">
            	<div class="list-pic">
                	<img src="../Public/image/goods/TV/2015010808785737.jpg" style="width:100%">
                </div>
                <div class="list-content">
                	<p class="goods-id" style="display:none"></p>
                	<span class="goods-name">正品小米超薄高清智能平板电视机Xiaomi/小米 小米电视3S 43英寸</span>
                    <div class="goods-price">
                    	<span>￥</span><span>1899.00</span>
                    </div>
                    <div class="goods-comment">
                    	<span>好评：</span>&nbsp;<span>99%</span><span class="addto-shoppingcart pic-suit"></span>
                    </div>
                </div>
            </li> -->
        </ul>
    </div>
</div>

<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
        <ul class="row list-unstyled index-bottom">
            <li id="index" class="col-xs-3"><span class="glyphicon glyphicon-home"></span><p>首页</p></li>
            <li id="goodslist" class="col-xs-3  bottom-active"><span class="glyphicon glyphicon-th-list"></span><p>所有商品</p></li>
            <li id="shoppingcart" class="col-xs-3"><span class="glyphicon glyphicon-shopping-cart"></span><p>购物车</p></li>
            <li id="personal.Tpl" class="col-xs-3"><span class="glyphicon glyphicon-user"></span><p>会员中心</p></li>
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
            <button type="button" class="btn btn-primary" onclick="gotoShoppingcart()">
               去瞧瞧
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
//加载默认列表
$(function(){
    //设定左右两块内容的高度
    $(".goodslist-left").css('height',$(window).height()-110);
    $(".goodslist-right").css('height',$(window).height()-110);
    //获取分类信息
    $.ajax({
        type:"post",
        url:SHOP+"/Goods/getGoodsType",
        dataType:"json",
        async:"false",
        success: function(data){
            for(var i in data){
                var obj = '<li onclick="" title="'+data[i].goods_type+'">'+data[i].ass_name+'</li>'
                $('.goodslist-left').append(obj);
            }
            $(".goodslist-left li").eq(0).css("background-color","#eee");
        },
        error: function(data){
            alert("网页错误");
        }
    });

	$.ajax({
		type:"post",
		url:SHOP+"/Goods/getGoods",
		dataType:"json",
        data:{
            type:'first',
        },
		async:"true",
		success: function(data){
            $(".goodslist-right").empty();
            for(var i in data){
                var obj = '<li class="col-xs-12 list-container padding-none"><div onclick="" class="list-pic"><img src="'+SHOP+'/Tpl/'+data[i].goods_pic+'" style="width:100%"></div><div class="list-content"><p class="goods-id" style="display:none">'+data[i].goods_id+'</p><span class="goods-name" onclick="">'+data[i].goods_name+'</span><div class="goods-price"><span>￥</span><span>'+data[i].goods_price+'</span></div><div class="goods-comment"><span>好评：</span>&nbsp;<span>100%</span><span onclick="" class="addto-shoppingcart pic-suit"></span>                </div>            </div>        </li>';
                $(".goodslist-right").append(obj);
            }
		},
		error: function(data){
			alert("网页错误");
		}
	})
})

//点击左侧导航栏
$(document).on("click",".goodslist-left li",function(e){
    var type = $(this).attr("title");
    $(this).parent().children().css("background-color","#fff");
    $(this).css("background-color","#eee");
    $.ajax({
        type:"post",
        url:SHOP+"/Goods/getGoods",
        dataType:"json",
        data:{
            type:type,
        },
        async:"true",
        success: function(data){
            $(".goodslist-right").empty();
            for(var i in data){
                var obj = '<li class="col-xs-12 list-container padding-none"><div onclick="" class="list-pic"><img src="'+SHOP+'/Tpl/'+data[i].goods_pic+'" style="width:100%"></div><div class="list-content"><p class="goods-id" style="display:none">'+data[i].goods_id+'</p><span onclick="" class="goods-name">'+data[i].goods_name+'</span><div class="goods-price"><span>￥</span><span>'+data[i].goods_price+'</span></div><div class="goods-comment"><span>好评：</span>&nbsp;<span>100%</span><span onclick="" class="addto-shoppingcart pic-suit"></span>                </div>            </div>        </li>';
                $(".goodslist-right").append(obj);
            }

        },
        error: function(data){
            alert("网页错误");
        }
    })
});

//点击商品
$(document).on("click",".list-pic,.goods-name",function(e){
    var goods_id = $(this).parent().find('.goods-id').text();
    // alert(goods_id);
    // $.ajax({
    //     type:"post",
    //     url:SHOP+"./Goods/goodsDetail",
    //     dataType:"json",
    //     data:{
    //         goods_id:goods_id,
    //     },
    //     success:function(data){
    //         // window.location.href=SHOP+data.url;
    //         alert(data.url);
    //     },
    //     error:{

    //     }   
    // })
    window.location.href= SHOP +'/Display/goodsDetail?goods_id='+goods_id;
});
//点击添加到购物车
$(document).on("click",".addto-shoppingcart",function(e){
    var goods_id = $(this).parent().parent().find('.goods-id').text();
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
</script>

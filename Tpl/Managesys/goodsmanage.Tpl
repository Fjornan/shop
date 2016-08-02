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
#addGoodsModal input,#addGoodsModal textarea{
    margin-bottom: 10px;
}
#updateGoodsModal input,#updateGoodsModal textarea{
    margin-bottom: 10px;
}
</style>
</head>

<div class=" container-fluid base-background">
    <div class="row padding-none list-unstyled">
        <div class="page-left padding-none">
            <div class="add-assortment text-center"><button class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span><span>添加分类</span></button></div>
        </div>
        <div class="page-right ">
            <div class="add-goods" title=""><button class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span><span>添加商品</span></button></div>
            <div class=""></div>
            <div class="goods-title">
                <li style="width:120px;margin-left:1px">商品图片</li>
                <li style="width:300px">名称</li>
                <li style="width:150px">编号</li>
                <li style="width:100px">价格(元)</li>
                <li style="width:100px">库存(件)</li>
                <li style="width:100px">销量(件)</li>
                <li style="width:200px">操作</li>
            </div>
            <div class="goods-contain">
                <!-- <div class="goodslist-contain">
                    <img class="goods-pic" src="../Public/image/goods/1/2015010808785737.jpg">
                    <ul class="goods-info list-unstyled">
                        <li class="goods-name-contain">
                            <div class="goods-name" style="padding-top:30px; line-height:normal;">正品小米超薄高清智能平板电视机Xiaomi/小米 小米电视3    </div>
                        </li>
                        <li class="goods-id-contain">
                            <div class="goods-id">2015010808785737</div>
                        </li>
                        <li class="goods-price-contain">
                            <div class="goods-price">2099</div>
                        </li>
                        <li class="goods-stock-contain">
                            <div class="goods-stock">2015</div>
                        </li>
                        <li class="goods-sold-contain">
                            <div class="goods-sold">9234</div>
                        </li>
                        <li class="goods-option-contain">
                            <div class="goods-option">
                                <button class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span><span>修改</span></button>
                                <button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span><span>删除</span></button>
                            </div>
                        </li>
                    </ul>
                </div> -->
            </div>
            
        </div>
    </div>
</div>
<!-- 操作提示框 -->
<div class="modal fade" id="optionResultModal" tabindex="-1" aria-labelledby="optionResultModalLabel" aria-hidden="true" style="top: 15%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="optionResultModalLabel" style="text-align: center;font-size: 24px;">
               删除成功
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
<!-- 确认删除提示框 -->
<div class="modal fade" id="deleteGoodsModal" tabindex="-1" aria-labelledby="deleteGoodsModalLabel" aria-hidden="true" style="top: 15%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="deleteGoodsModalLabel" style="text-align: center;font-size: 24px;">
               确认删除该商品
            </h4><br>
            <p style="display:none" class="delete-goods-id"></p>
         </div>
         <div class="modal-footer" style="border-top: 0px;text-align: center;">
            <button type="button" class="btn btn-primary delete-goods-confirm"  data-dismiss="modal" >确认
            </button>
            <button type="button" class="btn btn-primary" data-dismiss="modal">取消
            </button>
         </div>
      </div>
    </div>
</div>
<!-- /.modal -->
<!-- 修改商品信息 -->
<div class="modal fade" id="updateGoodsModal" tabindex="-1" role="dialog" aria-labelledby="updateGoodsModalLabel" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <p class="update_goods_id" style="display: none"></p>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="updateGoodsModalLabel"  style="text-align: center;font-size: 24px;">修改商品基本信息</h4>
        <form id="update-goods-form" action="" method="post" enctype="multipart/form-data">
            <input type="text" name="goods_id" class="form-control update-goods-id" readonly="true">
            <input type="text" name="goods_name" class="form-control update-goods-name" placeholder="请输入商品名称">
            <input type="text" name="goods_price" class="form-control update-goods-price" placeholder="请输入商品价格（元）">
            <input type="text" name="goods_stock" class="form-control update-goods-stock" placeholder="请输入商品库存量（件）">
            <textarea name="goods_instruction" class="form-control update-goods-instruction" rows="5" placeholder="请输入商品介绍"></textarea>
            <div class="modal-footer" style="border-top: 0px;text-align: center;">
                <button type="button" class="btn btn-primary update-goods-confirm" >确定</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 提示框 -->
<!-- 删除分类 -->
<div class="modal fade" id="deleteAssModal" tabindex="-1" role="dialog" aria-labelledby="deleteAssModalLabel"  style="top: 15%">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <p class="delete_goods_id" style="display: none"></p>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="deleteAssModalLabel"  style="text-align: center;font-size: 24px;">确认删除该分类？</h4>
        <p style="display:none" class="delete-goods-type"></p>
      </div>
      <div class="modal-footer" style="border-top: 0px;text-align: center;">
        <button type="button" class="btn btn-primary delete-ass-confirm" data-dismiss="modal">确定</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- 提示框 -->
<!-- 添加商品分类提示框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="top: 15%">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <p class="delete_goods_id" style="display: none"></p>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"  style="text-align: center;font-size: 24px;">添加分类</h4>
        <input type="text" class="form-control ass-name" placeholder="请输入要添加的分类名称">
      </div>
      <div class="modal-footer" style="border-top: 0px;text-align: center;">
        <button type="button" class="btn btn-primary add-ass-confirm" data-dismiss="modal">确定</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- 提示框 -->
<!-- 添加商品 -->
<div class="modal fade" id="addGoodsModal" tabindex="-1" role="dialog" aria-labelledby="addGoodsModalLabel" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <p class="delete_goods_id" style="display: none"></p>
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="addGoodsModalLabel"  style="text-align: center;font-size: 24px;">添加商品</h4>
        <form id="add-goods-form" action="" method="post" enctype="multipart/form-data">
            <input type="text" name="goods_name" class="form-control add-goods-name" placeholder="请输入商品名称">
            <input type="text" name="goods_id" class="form-control add-goods-id" placeholder="请输入8位产品编号">
            <input type="text" name="goods_price" class="form-control add-goods-price" placeholder="请输入商品价格（元）">
            <input type="text" name="goods_stock" class="form-control add-goods-stock" placeholder="请输入商品库存量（件）">
            <textarea name="goods_instruction" class="form-control add-goods-instruction" rows="3" placeholder="请输入商品介绍"></textarea>
            <input type="file" name="file" class="form-control add-goods-pic">
            <div class="modal-footer" style="border-top: 0px;text-align: center;">
            <button type="button" class="btn btn-primary add-goods-confirm" >确定</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 提示框 -->
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
            <button type="button" class="btn btn-primary" 
               data-dismiss="modal">取消
            </button>
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
//导航栏选择
$(".head-choose li").click(function(e) {
	$(this).parent().children().removeClass("active");
    $(this).addClass("active");
});

$(function(){
	 //设定左右两块内容的高度
    // $(".page-left").css('height',$(window).height()-85);
    // $(".page-right").css('height',$(window).height()-85);
    //获取分类信息
    $.ajax({
        type:"post",
        url:SHOP+"/Goods/getGoodsType",
        dataType:"json",
        async:"false",
        success: function(data){
            //显示分类
            for(var i in data){
                var obj = '<li title="'+data[i].goods_type+'">'+data[i].ass_name+'</li>';
                $('.page-left').append(obj);
            }
            //选中默认分类
            $(".page-left li").eq(0).css("background-color","#eee");
            $(".page-left li").eq(0).append('<span style="color:#fff; float:right;background-color:red" class="glyphicon glyphicon-remove delete-ass"></span>');
        },
        error: function(data){
            alert("网页错误");
        }
    });	
    //获取默认商品信息
    $.ajax({
        type:"post",
        url:SHOP+"/Managesys/getGoods",
        dataType:"json",
        async:"true",
        data:{
            goods_type:'first',
        },
        success: function(data){
            //设定该页显示的商品所属分类
            $('.add-goods').attr('title',data[0].goods_type);
            //显示商品
            for(var i in data){
                var obj = '<div class="goodslist-contain">                    <img class="goods-pic" src="'+SHOP+'/Tpl/'+data[i].goods_pic+'">                    <ul class="goods-info list-unstyled">                        <li class="goods-name-contain">                            <div class="goods-name" style="padding-top:30px; line-height:normal;">'+data[i].goods_name+'</div>                        </li>                        <li class="goods-id-contain">                            <div class="goods-id">'+data[i].goods_id+'</div>                        </li>                        <li class="goods-price-contain">                            <div class="goods-price">'+data[i].goods_price+'</div>                        </li>                        <li class="goods-stock-contain">                            <div class="goods-stock">'+data[i].goods_stock+'</div>                        </li>                        <li class="goods-sold-contain">                            <div class="goods-sold">'+data[i].goods_sold+'</div>                        </li>                        <li class="goods-option-contain">                            <div class="goods-option">                                <button class="btn btn-primary update-goods"><span class="glyphicon glyphicon-pencil"></span><span>修改</span></button>                                <button class="btn btn-danger delete-goods"><span class="glyphicon glyphicon-remove "></span><span>删除</span></button>                            </div>                        </li>                    </ul>                </div>';
                $('.goods-contain').append(obj);
                $(".page-left").css('height',$(window).height()-30);
                $(".page-right").css('height',$(window).height()-30);
                // $(".page-right").css('width',$(window).width());
            }
        },
        error: function(data){
            alert("网页错误");
        }
    }); 
})

//点击左侧导航栏
$(document).on("click",".page-left li",function(e){
    //获取该分类值
    var type = $(this).attr("title");
    //更改分类选中状态
    $(this).parent().children().css("background-color","#fff");
    $(this).css("background-color","#eee");
    $('.delete-ass').remove();
    $(this).append('<span style="color:#fff; float:right;background-color:red" class="glyphicon glyphicon-remove delete-ass"></span>');
    //发送服务器请求
    $.ajax({
        type:"post",
        url:SHOP+"/Managesys/getGoods",
        dataType:"json",
        data:{
            goods_type:type,
        },
        async:"true",
        success: function(data){
            //清空原有商品内容
            $(".goods-contain").empty();
            if(data.status == 2){
                $('.add-goods').attr('title',data.goods_type);
            }
            $('.add-goods').attr('title',data[0].goods_type);
            //获取商品信息
            for(var i in data){
                var obj = '<div class="goodslist-contain">                    <img class="goods-pic" src="'+SHOP+'/Tpl/'+data[i].goods_pic+'">                    <ul class="goods-info list-unstyled">                        <li class="goods-name-contain">                            <div class="goods-name" style="padding-top:30px; line-height:normal;">'+data[i].goods_name+'</div>                        </li>                        <li class="goods-id-contain">                            <div class="goods-id">'+data[i].goods_id+'</div>                        </li>                        <li class="goods-price-contain">                            <div class="goods-price">'+data[i].goods_price+'</div>                        </li>                        <li class="goods-stock-contain">                            <div class="goods-stock">'+data[i].goods_stock+'</div>                        </li>                        <li class="goods-sold-contain">                            <div class="goods-sold">'+data[i].goods_sold+'</div>                        </li>                        <li class="goods-option-contain">                            <div class="goods-option">                                <button class="btn btn-primary update-goods"><span class="glyphicon glyphicon-pencil"></span><span>修改</span></button>                                <button class="btn btn-danger delete-goods"><span class="glyphicon glyphicon-remove "></span><span>删除</span></button>                            </div>                        </li>                    </ul>                </div>';
                $('.goods-contain').append(obj);
                $(".page-left").css('height',$(window).height()-30);
                $(".page-right").css('height',$(window).height()-30);
                // $(".page-right").css('width',$(window).width());
            }
        },
        error: function(data){
            alert("网页错误");
        }
    })
});

//添加分类
$('.add-assortment button').click(function(e) {
	$('.ass-name').val('');
    $('#myModal').modal('toggle');
});
//确认添加分类
$('.add-ass-confirm').click(function(e){
	$.ajax({
        type:"post",
        url:SHOP+"/Managesys/addAssortment",
        dataType:"json",
        data:{
            ass_name:$('.ass-name').val(),
        },
        async:"true",
        success: function(data){
			if(data.status == 1){
				var obj = '<li title="'+data.assortment.goods_type+'">'+data.assortment.ass_name+'</li>'
                $('.page-left').append(obj);
			}
			
        },
        error: function(data){
            alert("网页错误");
        }
    })
});
//删除分类
$('.page-left').on("click",".delete-ass",function(e){
    var goods_type = $(this).parent().attr('title');
    $('.delete-goods-type').text(goods_type);
    $('#deleteAssModal').modal('toggle');
});
//确认删除分类
$('.delete-ass-confirm').click(function(e){

    $.ajax({
        type:"post",
        url:SHOP+"/Managesys/deleteAssortment",
        dataType:"json",
        data:{
            goods_type:$(".delete-goods-type").text(),
        },
        async:"true",
        success: function(data){
            if(data.status == 1){
                $('#optionResultModalLabel').text('分类删除成功');
                $('#optionResultModal').modal('toggle');
            }   
            window.location.reload(); 
                  
        },
        error: function(data){
            alert("网页错误");
        }
    })
});
//添加商品按钮
$(".page-right").on("click",".add-goods button",function(e){
    $('#addGoodsModal').modal('toggle');
});

//确认添加商品
$(".add-goods-confirm").click(function(e){
    var goods_type =$(".add-goods").attr('title');
    $('#add-goods-form').attr('action',SHOP+'/Managesys/addGoods?goods_type='+goods_type);
    $('#add-goods-form').submit();
});

//删除商品
$('.page-right').on("click",".delete-goods",function(e){
    var goods_id = $(this).parent().parent().parent().find('.goods-id').text();
    $('.delete-goods-id').text(goods_id);
    $('#deleteGoodsModal').modal('toggle');
});
//确认删除商品
$('.delete-goods-confirm').click(function(){
    var goods_id = $('.delete-goods-id').text();   
    var obj = $(".goods-id:contains("+goods_id+")").parent().parent().parent(); 
    $.ajax({
        type:"post",
        url:SHOP+"/Managesys/deleteGoods",
        dataType:"json",
        data:{
            goods_id:goods_id,
        },
        async:"true",
        success: function(data){
            if(data.status == 1){
                $('#optionResultModalLabel').text('商品删除成功');
                $('#optionResultModal').modal('toggle');
                obj.remove();   
            }   
                  
        },
        error: function(data){
            alert("网页错误");
        }
    })
});

//修改商品
$('.page-right').on("click",".update-goods",function(e){
    //弹出商品信息修改框
    $('#updateGoodsModal').modal('toggle');
    var goods_id = $(this).parent().parent().parent().find('.goods-id').text();
    //获取商品信息
    $.ajax({
        type:"post",
        url:SHOP+"/Managesys/getOneGoods",
        dataType:"json",
        data:{
            goods_id:goods_id,
        },
        async:"true",
        success: function(data){
            $('.update-goods-id').val(data.goods_id);
            $('.update-goods-name').val(data.goods_name);
            $('.update-goods-price').val(data.goods_price);
            $('.update-goods-stock').val(data.goods_stock);
            $('.update-goods-instruction').val(data.goods_instruction);
        },
        error: function(data){
            alert("网页错误");
        }
    })
})
//确认修改商品信息
$(".update-goods-confirm").click(function(e){
    $('#update-goods-form').attr('action',SHOP+'/Managesys/updateGoods');
    $('#update-goods-form').submit();
});
</script>	
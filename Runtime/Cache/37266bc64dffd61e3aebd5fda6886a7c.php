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
<title>编辑地址</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container text-center">
    	<span class="glyphicon glyphicon-menu-left myaddress-back" onClick="winTo('myaddress')"></span>
        <span class="head-title">我的地址</span>
        <div class="myaddress-add addressedit-save"><span">&nbsp;保存&nbsp; </span></div>
    </div>
</nav>
<div class="addressedit-contain container list-unstyled">
    <li><span for="contact">联系人</span><input type="text" id="contacts" placeholder="例如：张三"></li>
    <li><span for="contact">手机号</span><input type="text" id="mobile" placeholder="例如：18868181234" ></li>
    <li><span for="contact">收件区域（省/市/区）</span><input type="text" id="address_area" placeholder="例如：浙江省杭州市西湖区" ></li>
    <li><span for="contact">详细地址</span><input type="text" id="address_detail" placeholder="例如：文三路140号浙江外国语学院" ></li>
</div>
<div class="address-delete container text-center">
	删除该地址
</div>
<!-- 提示框 -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 30%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel" style="text-align: center;font-size: 24px;">
               地址修改成功
            </h4>
         </div>
         <div class="modal-footer" style="border-top: 0px;text-align: center;">
            <button type="button" class="btn btn-primary" 
               data-dismiss="modal" onclick="winTo('myaddress')">确认
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</body>
</html>
<script>
var id = "<?php echo ($id); ?>";
//页面跳转
function winTo(winname){
    window.location.href=SHOP+'/Display/'+winname;
}

$(function(){
    if(id){
        $('.head-title').text('编辑地址');
        //获取该id的地址信息
        $.ajax({
            type:"post",
            url:SHOP+"/Personal/getMyAddress",
            dataType:"json",
            async:"true",
            data:{
                id:id,
            },
            success: function(data){
                $("#contacts").val(data[0].contacts);
                $("#mobile").val(data[0].mobile);
                $("#address_area").val(data[0].address_area);
                $("#address_detail").val(data[0].address_detail);
            },
            error: function(data){
                alert("网页错误");
            }
        })
    }else{
        $('.head-title').text('新增地址');
        $('.address-delete').remove();
    }


})

$('.addressedit-save').click(function(){
    if(!id){
        id ='new';
    }
    $.ajax({
        type:"post",
        url:SHOP+"/Personal/updateMyAddress",
        dataType:"json",
        async:"true",
        data:{
            id:id,
            contacts:$("#contacts").val(),
            mobile:$("#mobile").val(),
            address_area:$("#address_area").val(),
            address_detail:$("#address_detail").val(),
        },
        success: function(data){
            if(data.status==1){
                $('#myModalLabel').text('地址修改成功');
                $('#myModal').modal('toggle');
            }
        },
        error: function(data){
            alert("网页错误");
        }
    })
});
$('.address-delete').click(function(){
    $.ajax({
        type:"post",
        url:SHOP+"/Personal/deleteMyAddress",
        dataType:"json",
        async:"true",
        data:{
            id:id,
        },
        success: function(data){
            if(data.status==1){
                $('#myModalLabel').text('该地址删除成功');
                $('#myModal').modal('toggle');
            }
        },
        error: function(data){
            alert("网页错误");
        }
    })
})
</script>
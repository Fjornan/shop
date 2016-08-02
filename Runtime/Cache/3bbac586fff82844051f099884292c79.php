<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>家电商城后台管理</title>
<link href="../Public/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../Public/css/managesys.css" rel="stylesheet" type="text/css" >
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>   
<script src="../Public/js/common.js"></script>  
<style type="text/css">
  .modal-header input{
    margin-bottom: 10px;
  }
</style>
</head>
<body>
<nav class="navbar navbar-default margin-none">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="font-family:'Microsoft YaHei UI'; letter-spacing:1px">家电商城后台管理</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav head-choose">     
        <li class="active"><a href="#" onClick="openWin('goodsmanage')">商品管理</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">订单管理<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#" class="needpay">待付款</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" class="needdelivery">待发货</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" class="needconfirm">待确认收货</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" class="finish">已完成</a></li>
          </ul>
        </li>
        <li><a href="#" onClick="openWin('usermanage')">用户管理</a></li>
<!--          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">卡券管理<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">制作卡券</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">发放卡券</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">删除卡券</a></li>
          </ul>
        </li> -->
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">more <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#" class="changePWD">密码修改</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" class="safeExit">安全退出</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="index-contain">
  <iframe src="" frameborder=0 height="auto" scrolling="yes"></iframe>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom navbar-inverse" style="height:35px; min-height:35px">
  <div class="container text-center" style="color:#fff;line-height:35px">
    made by F_jornan
  </div>
</nav>
<!-- 安全退出提示框 -->
<div class="modal fade" id="safeExitModal" tabindex="-1" aria-labelledby="safeExitModalLabel" aria-hidden="true" style="top: 15%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="safeExitModalLabel" style="text-align: center;font-size: 24px;">
               确认安全退出？
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
<!-- 修改密码提示框 -->
<div class="modal fade" id="changePWDModal" tabindex="-1" aria-labelledby="changePWDModalLabel" aria-hidden="true" style="top: 15%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="changePWDModalLabel" style="text-align: center;font-size: 24px;">
               密码修改
            </h4><br>
            <input type="text" class="form-control ass-name"  placeholder="请输入原密码" />
            <input type="password" class="form-control ass-name"  placeholder="请输入新密码" />
            <input type="password" class="form-control ass-name"  placeholder="请再次输入新密码" />
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
</body>
</html>
<script>
//导航标签选中阴影
$(".head-choose li").click(function(e) {
	$(this).parent().children().removeClass("active");
    $(this).addClass("active");
});
//设置iframe长宽
$(function(){
  $('.index-contain iframe').css('width',$(window).width());
  $('.index-contain iframe').css('height',$(window).height()-85);
  //设置默认跳转到商品管理界面
  $('.index-contain iframe').attr('src',SHOP+'/Display/goodsmanage');
});
//跳转函数
function openWin(winname){
	$('.index-contain iframe').attr('src',SHOP+'/Display/'+winname);
}
//跳转待支付订单界面
$(".needpay").click(function(){
  openWin('ordermanage?order_status=1');
})
//跳转待发货订单界面
$(".needdelivery").click(function(){
  openWin('ordermanage?order_status=2&&isdelivery=1');
})
//跳转待确认收货订单界面
$(".needconfirm").click(function(){
  openWin('ordermanage?order_status=2&&isdelivery=2');
})
//跳转已完成订单界面
$(".finish").click(function(){
  openWin('ordermanage?order_status=3');
})

$('.changePWD').click(function(){
  $('#changePWDModal').modal('toggle');
})
$('.safeExit').click(function(){
  $('#safeExitModal').modal('toggle');
})
</script>
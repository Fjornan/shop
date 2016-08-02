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

<div class="container-fluid padding-none base-background">

</div>
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
            <button type="button" class="btn btn-primary"  data-dismiss="modal" >确认
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

//初始化
$(function(){
   //设定页面高度
   $(".base-background").css('height',$(window).height());
   //获取已有卡券信息
   $.ajax({
        type:"post",
        url:SHOP+"/Managesys/getCoupon",
        dataType:"json",
        async:"true",
        success: function(data){

        },
        error: function(data){
            alert("网页错误");
        }
    })
})

</script>

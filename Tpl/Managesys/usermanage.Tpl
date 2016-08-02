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
    <div class="order-list-head list-unstyled">
        <li style="width:400px">用户id</li>
        <li style="width:200px">用户昵称</li>
        <li style="width:200px">用户权限</li>
        <li style="width:300px">操作</li>
    </div>
<!--     <div class="order-list-contain list-unstyled">
        <li style="width:400px">用户id</li>
        <li style="width:200px">用户昵称</li>
        <li style="width:200px">
            <button type="button" class="btn btn-warning"><span>会员</span></button>
        </li>
        <li style="width:300px">
            <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-refresh"></span><span>更改权限</span></button>
            <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span><span>删除用户</span></button>
        </li>
    </div> -->
<!--     <div class="order-list-contain list-unstyled">
        <li style="width:400px">用户id</li>
        <li style="width:200px">用户昵称</li>
        <li style="width:200px">
            <button type="button" class="btn btn-primary  "><span>普通</span></button>
        </li>
        <li style="width:300px">
            <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-refresh"></span><span>更改权限</span></button>
            <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span><span>删除用户</span></button>
        </li>
    </div> -->
</div>
<!-- 删除用户提示框 -->
<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true" style="top: 15%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="deleteUserModalLabel" style="text-align: center;font-size: 24px;">
               确认删除该用户？
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
<!-- 更改用户权限提示框 -->
<div class="modal fade" id="changeUserStatusModal" tabindex="-1" aria-labelledby="changeUserStatusModalLabel" aria-hidden="true" style="top: 15%">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="changeUserStatusModalLabel" style="text-align: center;font-size: 24px;">
               确认更该用户权限？
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
   $.ajax({
        type:"post",
        url:SHOP+"/Managesys/getUser",
        dataType:"json",
        async:"true",
        success: function(data){
            for(var i in data){
              var obj = '<div class="order-list-contain list-unstyled">        <li style="width:400px">'+data[i].loginkey+'</li>        <li style="width:200px">'+data[i].username+'</li>        <li style="width:200px">'+showStatus(data[i].user_status)+'</li>        <li style="width:300px">            <button type="button" class="btn btn-success changeUserStatus"><span class="glyphicon glyphicon-refresh"></span><span>更改权限</span></button>            <button type="button" class="btn btn-danger deleteUser"><span class="glyphicon glyphicon-remove"></span><span>删除用户</span></button>        </li>    </div>';
              $('.base-background').append(obj);
            }
        },
        error: function(data){
            alert("网页错误");
        }
    })
})

// function shwoBtn(status){
//     if(status == 1){
//     return 'primary';
//   }else if(status ==2){
//     return 'warning';
//   }
// }
function showStatus(status){
  if(status == 1){
    return '普通';
  }else if(status ==2){
    return '会员';
  }
}

$('.base-background').on('click','.changeUserStatus',function(){
    $('#changeUserStatusModal').modal('toggle');
});
$('.base-background').on('click','.deleteUser',function(){
    $('#deleteUserModal').modal('toggle');
});
</script>

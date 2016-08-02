<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
<link href="../Public/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../Public/css/style.css" rel="stylesheet" type="text/css" >
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>   
<script src="../Public/js/common.js"></script>  
<title>支付系统</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container text-center">
        <span class="glyphicon glyphicon-menu-left winback" onClick="winTo('shoppingcart')"></span>
        <span class="head-title">付款页面</span  >
        <span>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
</nav>

<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container orderconfirm-bottom">
        <div class="row">
            <div style="background-color:red; color:#fff" class="col-xs-12 padding-none text-center finish-payment">完成付款</div>
        </div>
    </div>
</nav>
</body>
</html>

<script>
//页面跳转
function winTo(winname){
    window.location.href=SHOP+'/Display/'+winname;
}
var order_id = "<{$order_id}>";
// $(function(){
//     //调整界面高度
//     $('.orderconfirm-contain').css('height',$(window).height()-50);
//     //获取我的卡券信息
//     $.ajax({
//         type: "post",  
//         url: SHOP + "/Order/orderConfirm",  
//         dataType: "json",   
//         success: function(data){    
           
//         }, 
//         error:function(data){
//             alert('获取失败');
//         }
//     });
// })
$('.finish-payment').click(function(){
    $.ajax({
        type: "post",  
        url: SHOP + "/Order/finishPayment",  
        dataType: "json",   
        data:{
            order_id:order_id,
        },
        success: function(data){    
           window.location.href=SHOP+'/Display/myorder?status=0';
        }, 
        error:function(data){
            alert('获取失败');
        }
    });
})

</script>

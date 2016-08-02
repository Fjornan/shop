<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
<link href="../Public/css/bootstrap.min.css" rel="stylesheet">
<link href="../Public/css/swiper.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../Public/css/style.css">
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>   
<script src="../Public/js/swiper.jquery.min.js"></script>
<script src="../Public/js/common.js"></script>  
<title>优惠领取</title>

</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container text-center">
        <span class="glyphicon glyphicon-menu-left winback" onClick="winTo('index')"></span>
        <span class="head-title">优惠领取</span  >
        <span>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
</nav>

<div class="container coupon-contain">
   <!--  <div class="coupon-list-contain row margin-none" style="box-shadow:0px 0px 10px #999;" >
        <div class="coupon-list col-xs-9 padding-none">
            <span style="display:none" class="coupon-id">1</span>
            <div class="coupon-content text-center">
                <span class="coupon-pic"></span><span class="coupon-detail">满100减5元</span>
            </div>
            <div class="coupon-note"><span>剩余券数：</span><span class="coupon-deadline">9999</span></div>
        </div>
        <div class="col-xs-3 coupon-add text-center padding-none">领取</div>
    </div> -->
</div>
</body>
</html>

<script>
//页面跳转
function winTo(winname){
    window.location.href=SHOP+'/Display/'+winname;
}

$(function(){
    //调整界面高度
    $('.coupon-contain').css('height',$(window).height()-50);
    //获取我的卡券信息
    $.ajax({
        type:"post",
        url:SHOP+"/Index/getCoupon",
        dataType:"json",
        async:"true",
        success: function(data){
            for(var i in data){
                var obj = '<div class="coupon-list-contain row margin-none" style="box-shadow:0px 0px 10px #999;" >        <div class="coupon-list col-xs-9 padding-none">            <span style="display:none" class="coupon-id">'+data[i].coupon_id+'</span>            <div class="coupon-content text-center">                <span class="coupon-pic"></span><span class="coupon-detail">'+data[i].coupon_detail+'</span>            </div>            <div class="coupon-note"><span>剩余券数：</span><span class="coupon-amount">'+data[i].coupon_amount+'</span><span>张</span></div>        </div>        <div class="col-xs-3 coupon-add text-center padding-none">领取</div>    </div>';
                $('.coupon-contain').append(obj); 
            }
        },
        error: function(data){
            alert("网页错误");
        }
    })
})
//领取卡券
$('.coupon-contain').on("click",".coupon-add",function(e){
    var coupon_id = $(this).parent().find('.coupon-id').text();
    var obj = $(this);
    $.ajax({
        type:"post",
        url:SHOP+"/Index/addCoupon",
        dataType:"json",
        async:"true",
        data:{
            coupon_id:coupon_id,
        },
        success: function(data){
            obj.css('background-color','#F4F66A');
            obj.text('已领取');
        },
        error: function(data){
            alert("网页错误");
        }
    })
})
</script>

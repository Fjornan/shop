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
<title>我的地址</title>
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container text-center">
    	<span class="glyphicon glyphicon-menu-left winback" onClick="winTo('personal')"></span>
        <span class="head-title">我的地址</span  >
        <div class="myaddress-add" onclick="winTo('addressEdit')"><span">&nbsp;新增&nbsp; </span></div>
    </div>
</nav>
<div class="myaddress-contain">
	<!-- <div class="myaddress-list container">
        <div class="row">
            <div class="col-xs-10 myaddress-left">
                <p class="myaddress-address">
                    <span class="myaddress-area">浙江省杭州市西湖区</span><span class="myaddress-detail">文三路140号浙江外国语学院</span>
                </p>
                <p><span class="myaddress-contacts">冯嘉楠</span>&nbsp;&nbsp;&nbsp;<span class="myaddress-mobile">15168365220</span></p>
            </div>
            <div class="col-xs-2 myaddress-right">
                <span class="glyphicon glyphicon-menu-right address-edit"></span>
            </div>
        </div>
    </div> -->
</div>

<div>

</div>
</body>
</html>
<script>

//页面跳转
function winTo(winname){
    window.location.href=SHOP+'/Display/'+winname;
}

$(function(){
    //获取我的地址信息
    $.ajax({
        type:"post",
        url:SHOP+"/Personal/getMyAddress",
        dataType:"json",
        async:"true",
        success: function(data){
            for(var i in data){
                var obj = '<div class="myaddress-list container"> <p class="id" style="display:none;">'+data[i].id+'</p>       <div class="row">            <div class="col-xs-10 myaddress-left">                <p class="myaddress-address">                    <span class="myaddress-area">'+data[i].address_area+'</span><span class="myaddress-detail">'+data[i].address_detail+'</span>                </p>                <p><span class="myaddress-contacts">'+data[i].contacts+'</span>&nbsp;&nbsp;&nbsp;<span class="myaddress-mobile">'+data[i].mobile+'</span></p>            </div>            <div class="col-xs-2 myaddress-right">                <span class="glyphicon glyphicon-menu-right address-edit"></span>            </div>        </div>    </div>';
                $('.myaddress-contain').append(obj);  
            }
        },
        error: function(data){
            alert("网页错误");
        }
    })
})
//编辑我的地址
$('.myaddress-contain').on("click",".myaddress-list",function(e){
    var id = $(this).find('.id').text();
    window.location.href= SHOP +'/Display/addressEdit?id='+id;
});
</script>

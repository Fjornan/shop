<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
<link rel="stylesheet" type="text/css" href="../Public/css/style.css">
<link href="../Public/css/bootstrap.min.css" rel="stylesheet">
<link href="../Public/css/swiper.min.css" rel="stylesheet">
<script src="../Public/js/jquery-1.11.3.min.js"></script>
<script src="../Public/js/bootstrap.min.js"></script>   
<script src="../Public/js/swiper.jquery.min.js"></script>
<script src="../Public/js/common.js"></script>  
<title>极速秒杀</title>

</head>

<body>

<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
        <ul class="row list-unstyled index-bottom">
            <li id="index" class="col-xs-3"><span class="glyphicon glyphicon-home"></span><p>首页</p></li>
            <li id="goodslist" class="col-xs-3"><span class="glyphicon glyphicon-th-list"></span><p>所有商品</p></li>
            <li id="shoppingcart" class="col-xs-3"><span class="glyphicon glyphicon-shopping-cart"></span><p>购物车</p></li>
            <li id="personal.Tpl" class="col-xs-3"><span class="glyphicon glyphicon-user"></span><p>会员中心</p></li>
        </div>
    </div>
</nav>
<div class="text-center" style="margin-top:10px;font-family:'Microsoft YaHei UI'">暂未开放</div>
</body>
</html>

<script>
//页面跳转
$(".index-bottom li").click(function(e) {
   var winname = $(this).attr("id");
   window.location.href= SHOP +'/Display/'+winname;
});
</script>

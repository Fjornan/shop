   var SHOP = "http://localhost/shop";
  // var SHOP = "http://115.159.4.35/fjn/shop";
  //var SHOP = "http://o145463l71.iok.la/shop"
   	$(".index-bottom li").click(function(e) {
	   var winname = $(this).attr("id");
       window.location.href= SHOP +'/Display/'+winname;
    });
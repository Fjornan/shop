<html>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>后台管理登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="../Public/css/reset.css">
        <link rel="stylesheet" href="../Public/css/login.css">
        <!-- js -->
        <script src="../Public/js/jquery-1.11.3.min.js"></script>
        <script src="../Public/js/managelogin.js"></script>
        <script src="../Public/js/common.js"></script>   
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="style/js/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container">
            <h1>家电商城后台管理</h1>
            <form action="" method="post">
                <input type="text" name="theUser" class="username" placeholder="请输入您的账号">
                <input type="password" name="theUserPWD" class="password" placeholder="请输入您的密码">
                <input type="Captcha" class="Captcha" name="Captcha" placeholder="请输入验证码">
                <input type = "button" id="code" onclick="createCode()"/> 
                <button type="submit" class="submit_button">登录</button>
                <div class="prompt"><span>hello</span></div>
                <div class="error"><span>+</span></div>
            </form>
        </div>
		
        <!-- Javascript -->
    </body>
</html>
<script type="text/javascript">
//生成验证码
window.onload=createCode();
 function createCode(){  
     code = "";   
     var codeLength = 4;//验证码的长度  
     var checkCode = document.getElementById("code");   
     var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',  
     'S','T','U','V','W','X','Y','Z');//随机数  
     for(var i = 0; i < codeLength; i++) {//循环操作  
        var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）  
        code += random[index];//根据索引取得随机数加到code上  
    }  
    checkCode.value = code;//把code值赋给验证码  
}  
//提交判断
jQuery(document).ready(function() {
    

    $('.page-container form').submit(function(){
        var username = $(this).find('.username').val();
        var password = $(this).find('.password').val();
        if(username == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '25px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.username').focus();
            });
            $(this).find('.prompt span').text('账号不能为空！')
            $(this).find('.prompt').fadeIn('fast');
            return false;
        }
        
        if(password == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '92px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.password').focus();
            });
            $(this).find('.prompt span').text('密码不能为空！')
            $(this).find('.prompt').fadeIn('fast');
            return false;
        }

        /****************************/
        var inputCode = $(this).find('.Captcha').val().toUpperCase();
        var code = $(this).find('#code').val(); //取得输入的验证码并转化为大写        
        if(inputCode.length <= 0 || inputCode != code) { //若输入的验证码长度为0  
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '160px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.Captcha').focus();
            });
            if(inputCode.length <= 0) {
                $(this).find('.prompt span').text('验证码不能为空！')
                $(this).find('.prompt').fadeIn('fast');
            }
            else {
                $(this).find('.prompt span').text('验证码错误！')
                $(this).find('.prompt').fadeIn('fast');
            }
            return false;
        }         
        
        /*************后台判断**************/    
        $.ajax({  
            type: "post",  
            url: SHOP+"/Managesys/login",  
            dataType: "json",  
            data: {
                username:username,
                password:password,
                },  
            success: function(data){ 
                if(data.status == 2 ){
                    $('.page-container').find('.prompt span').text('登录失败');
                    $('.page-container').find('.prompt').fadeIn('fast');
                }
                if(data.status == 1){
                    winTo('manageindex');
                }
                
            }, 
            error:function(data){
                alert("错误");
            }
        });
        return false;  
        /****************************/      
    });

    $('.page-container form .username, .page-container form .password, .page-container form .Captcha').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
        $(this).parent().find('.prompt').fadeOut('fast');
    });
    
    /*************/

});

//页面跳转
function winTo(winname){
    window.location.href=SHOP+'/Display/'+winname;
}
</script>



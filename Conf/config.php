<?php

return array(
	'DEFAULT_MODULE'    			=> 'Index', // 项目默认控制模块
	'TMPL_TEMPLATE_SUFFIX' 			=> '.Tpl', // 模板文件后缀
	'TMPL_L_DELIM' 					=> '<{', // 模板变量开始符
	'TMPL_R_DELIM' 					=> '}>', // 模板变量结束符
    'URL_HTML_SUFFIX'				=> '',	// URL伪静态
	'TMPL_STRIP_SPACE' 				=> true, //去除模板文件里面的html空格与换行
	'LOG_RECORD'					=> false, // 开启了日志记录
	'LOG_RECORD_LEVEL'				=> array('EMERG','ALERT','CRIT','ERR','WARN','NOTIC','INFO','DEBUG','SQL'),	// 日志类型
 	'COOKIE_PREFIX'         		=> '', // Cookie前缀
	'TMPL_CACHE_ON' 				=> true, // 关闭模版缓存
    'DB_FIELDS_CACHE'				=> true,

	'DB_TYPE'   					=> 'mysql', // 数据库类型 
	'DB_HOST'   					=> '127.0.0.1', //服务器地址115.159.4.35
	'DB_NAME'   					=> 'shop', // 数据库名     
	'DB_USER'   					=> 'root', // 用户名     
	'DB_PWD'    					=> 'root',// 密码
	'DB_PORT'   					=> 3306, // 端口
	'DB_PREFIX' 					=> '', // 数据库表前缀

	'URL_MODEL'						=> 2, // URL地址模式
	'SHOW_ERROR_MSG' 				=> false, // 异常信息提示
	'SHOW_PAGE_TRACE' 				=> false, // THINKPHP调试信息
	'URL_CASE_INSENSITIVE'          => true,

	'LOG_RECORD'=>true,//开启了日志记录
  	'LOG_RECORD_LEVEL'=>array('EMERG','ALERT','ERROR'),

);

?>

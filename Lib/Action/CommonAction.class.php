<?php
//让浏览器用utf-8阅读php文本
header('Content-type:text/html;charset=utf-8');
class CommonAction extends Action {
    
    //构造方法
    public function _initialize(){
		$this->assign("public", "../Public");
    	
    }

    
    
}
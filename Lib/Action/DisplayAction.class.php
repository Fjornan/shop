<?php
class DisplayAction extends Action {
    //首页页面
	public function index(){
    	$this->display('Index/index');
    }
    //所有商品页面
    public function goodslist(){
    	$this->display('Index/goodslist');
    }
    //购物车页面
    public function shoppingcart(){
    	$this->display('Index/shoppingcart');
    }
    //会员中心页面
    public function personal(){
    	$this->display('Index/personal');
    }
    //极速秒杀页面
    public function seckill(){
        $this->display('Index/seckill');
    }
    //门店信息页面
    public function storemessage(){
        $this->display('Index/storemessage');
    }
    //商品详情页面
    public function goodsdetail(){
        $goods_id = I('get.goods_id');
        $this->assign('goods_id',$goods_id);
        $this->display('Index/goodsdetail');
    }
    //卡券页面
    public function coupon(){
        $this->display('Index/coupon');
    }
    //我的地址页面
    public function myaddress(){
        $this->display('Personal/myaddress');
    }
    //新增、编辑地址页面
    public function addressEdit(){
        $id =  I('get.id');
        $this->assign('id',$id);
        $this->display('Personal/addressEdit');
    }
    //我的卡券页面
    public function mycoupon(){
        $this->display('Personal/mycoupon');
    }
    //我的订单页面
    public function myorder(){
        $order_status = I('get.status');
        $this->assign('order_status',$order_status);
        $this->display('Personal/myorder');
    }
    //订单详情页面
    public function orderdetail(){
        $order_id = I('get.order_id');
        $this->assign('order_id',$order_id);
        $this->display('Order/orderdetail');
    }
    //订单确认页面
    public function orderconfirm(){
        $this->display('Order/orderconfirm');
    }
    //支付页面
    public function payment(){
        $order_id = I('get.order_id');
        $this->assign('order_id',$order_id);
        $this->display('Order/payment');
    }
    /****************************后台管理跳转********************************/
    //登录页面
    public function managesys(){
        $this->display('Managesys/login');
    }
    //主页
    public function manageindex(){
        $this->display('Managesys/manageindex');
    }
    //商品管理页面
    public function goodsmanage(){
        $this->display('Managesys/goodsmanage');
    }
    //订单管理页面
    public function ordermanage(){
        $order_status = I('get.order_status');
        $this->assign('order_status',$order_status);
        $isdelivery = I('get.isdelivery');
        $this->assign('isdelivery',$isdelivery);
        $this->display('Managesys/ordermanage');
    }
    public function usermanage(){
        $this->display('Managesys/usermanage');
    }
}
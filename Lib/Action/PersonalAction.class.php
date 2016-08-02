<?php
	class PersonalAction extends Action {
		//获取会员信息接口
	    public function userMessage(){
	    	$value = session('loginkey');
	    	$map['loginkey'] =$value; 
	    	$ret = M('user')->where($map)->select();
	    	echo json_encode($ret);	    	
	    }
	    //获取我的地址信息接口
	    public function getMyAddress(){
	    	$loginkey = session('loginkey');
	    	$id = I('post.id');
	    	if($id){
	    		$map['id'] = $id;
	    	}else{
	    		$map['loginkey'] = $loginkey;
	    	}
	    	$ret = M('address')->where($map)->select();
	    	echo json_encode($ret);	
	    }
	    //添加或修改收件地址信息
	    public function updateMyAddress(){
	    	$postdata = I();
	    	//当id为new时，新增一条地址记录
	    	if($postdata['id']=='new'){
	    		$data['loginkey'] = session('loginkey');
	    		$data['contacts'] = $postdata['contacts'];
	    		$data['mobile'] = $postdata['mobile'];
	    		$data['address_area'] = $postdata['address_area'];
	    		$data['address_detail'] = $postdata['address_detail'];
	    		if(!M('address')->where(array('loginkey'=>$data['loginkey']))->select()){
	    			$data['status']=1;
	    		}
	    		M('address')->add($data);
	    	}else{
	    		//修改已存在的地址记录
				$search['id'] = $postdata['id'];
	    		$ret = M('address')->where($search)->save($postdata);
	    	}
	    	
	    	echo json_encode(array('status'=>1));	
	    }
	    //删除地址
	    public function deleteMyAddress(){
	    	$map['id'] = I('post.id');
	    	M('address')->where($map)->delete();
	    	echo json_encode(array('status'=>1));
	    }
	    //获取我的卡券信息
	    public function getMyCoupon(){
	    	$search['loginkey'] = session('loginkey');
	    	$ret = M('mycoupon')->where($search)->select();
	    	foreach($ret as $key => $val){
	    		//获取该卡券在后台的信息
	    		$getdata = M('coupon')->where(array('coupon_id'=>$val['coupon_id']))->select();
	    		//返回json加入截止日期
	    		$ret[$key]['coupon_deadline'] = $getdata[0]['coupon_deadline'];
	    		//返回json加入优惠详情
	    		$full = $getdata[0]['coupon_full'];
	    		$cut = $getdata[0]['coupon_cut'];
	    		$coupon_detail = "满".strval($full)."减".strval($cut)."元";
	    		$ret[$key]['coupon_detail'] = $coupon_detail;
	    	}
	    	echo json_encode($ret);
	    }
	    //获取我的订单信息
	    public function getMyOrder(){
	    	$search['loginkey'] = session('loginkey');
	    	$order_status = I('post.order_status');
	    	if($order_status == 0){
	    		$search['order_status'] = array('elt',2);
	    	}else{
	    		$search['order_status'] = $order_status;
	    	}
	    		//去重复字段
	    		$ret = M('order')->where($search)->group('order_id')->select();
	    	
	    	echo json_encode($ret);
	    }
	}
?>
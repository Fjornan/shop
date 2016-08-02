<?php
class OrderAction extends Action{
	//获取默认收件地址信息
	public function getAddressInfo(){
		$search['loginkey']=session('loginkey');
		$search['status']=1;
		$data = M('address')->where($search)->find();
		return $data;
	}
	//订单确认接口
	public function orderConfirm(){
		//获取购物车内的信息
		$Shoppingcart = A('ShoppingCart');
		$ret = $Shoppingcart ->shoppingcartInfo();
		//获取默认收件地址信息
		$data = $this->getAddressInfo();
		$ret['contacts'] = $data['contacts'];
		$ret['address'] = $data['address_area'].$data['address_detail'];
		$ret['mobile'] = $data['mobile'];
		echo json_encode($ret);
	}
	//生成订单接口
	public function generateOrder(){
		//订单所属用户,开始时间
		$map['loginkey'] = session('loginkey');
		$map['order_begin'] = date('Y-m-d H:i:s');

		//订单收件地址信息
		// $data = $this->getAddressInfo();
		// $map['shipping_contacts'] = $data['contacts'];
		// $map['shipping_address'] = $data['address_area'].$data['address_detail'];
		// $map['shipping_mobile'] = $data['mobile'];
		$postdata = I();
		$map['shipping_contacts'] = $postdata['shipping_contacts'];
		$map['shipping_address'] = $postdata['shipping_address'];
		$map['shipping_mobile'] = $postdata['shipping_mobile'];
		//获取购物车内的信息,依次生成订单
		$Shoppingcart = A('ShoppingCart');
		$ret = $Shoppingcart ->shoppingcartInfo();
		//生成订单编号
		$order_id = substr(date('YmdHi'),2).str_pad(count($ret[row]),2,0,STR_PAD_LEFT).str_pad(rand(1,9999),4,0,STR_PAD_LEFT);
		$map['order_id'] = $order_id;
		foreach($ret[row] as $key=>$val){
			$map['goods_id'] = $val['goods_id'];
			$map['goods_name'] = $val['goods_name'];
			$map['buy_amount'] = $val['amount'];
			//添加到订单表
			M('order')->add($map);
			//删除购物车表中该商品
			$search['goods_id'] = $val['goods_id'];
			$search['loginkey'] = session('loginkey');
			M('shoppingcart')->where($search)->delete();
		}
		echo json_encode($map);

	}
	//完成订单
	public function finishPayment(){
		$search['order_id'] = I('post.order_id');
		$data['order_status'] = 2;
		M('order')->where($search)->save($data);
		echo json_encode(array('status'=>1));
	}
	//获取订单详情
	public function getOrderDetail(){
		$search['order_id'] = I('post.order_id');
		$ret = M('order')->where($search)->select();
		foreach ($ret as $key => $val) {
            $search['goods_id'] =  $val['goods_id'];
            $ret[$key]['goods_pic'] = M('goods')->where($search)->getField('goods_pic');
            $ret[$key]['goods_price'] = M('goods')->where($search)->getField('goods_price');
        }
		echo json_encode($ret);
	}
	//未付款时取消订单
	public function cancelOrder(){
		$search['order_id'] = I('post.order_id');
		M('order')->where($search)->delete();
		echo json_encode(array('status'=>1));
	}
	//确认收货
	public function confirmReceive(){
		$search['order_id'] = I('post.order_id');
		$data['order_status'] = 3;
		M('order')->where($search)->save($data);
		// $getdata = M('order')->where($search)->select();
		// foreach ($getdata as $key => $val) {
		// 	$search['goods_id'] = $val['goods_id'];
		// 	M('goods')->where($search)->setField('goods_sold','goods_sold'++);
		// }
		echo json_encode(array('status'=>1,$search));
	}
}

?>
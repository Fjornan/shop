<?php
	/**
	* 
	*/
	class GoodsAction extends Action{
		//获取分类信息
		public function getGoodsType(){
			$ret = M('assortment')->order('goods_type')->select();
			echo json_encode($ret);
		}
		//获取分类下所有商品
		public function getGoods(){
			$type['goods_type'] = I('post.type');
			if($type['goods_type'] == 'first'){
				$ass = M('assortment')->order('goods_type')->find();
				$type['goods_type'] = $ass['goods_type'];
			}
	    	$ret = M('goods')->where($type)->select();
			echo json_encode($ret);    	
	    }
	    //跳转商品详情页面
	    public function goodsDetail(){
	    	$goods_id = I('post.goods_id');
			$search['goods_id'] = $goods_id;
	    	$ret = M('goods')->where($search)->select();
	    	//判断是否为已收藏
	    	$search['loginkey'] = session('loginkey');
	    	$search['_logic'] = 'AND';
	    	if(M('favorite')->where($search)->find()){
	    		$ret['isfavorite'] = 1; //已收藏
	    	}else{
	    		$ret['isfavorite'] = 2; //未收藏
	    	}
	    	echo json_encode($ret); 
	    }
	    //收藏或取消收藏
	    public function goodsCollect(){
	    	$goods_id = I('post.goods_id');
	    	$search['goods_id'] = $goods_id;
	    	$search['loginkey'] = session('loginkey');
	    	$search['_logic'] = 'AND';
	    	if(M('favorite')->where($search)->find()){
	    		M('favorite')->where($search)->delete();
	    		echo json_encode(array('status'=>1));
	    	}else{
	    		M('favorite')->add($search);
	    		echo json_encode(array('status'=>2));
	    	}
	    }
	    //快速添加到购物车
	    public function goodsAdd(){
	    	//获取添加到购物车的商品编号和用户的loginkey
	    	$postdata = I();
	    	$goods_id = $postdata['goods_id'];
	    	$value = session('loginkey');
	    	$loginkey = $value;
	    	//实例化shoppingcart对象
	    	$Cart = M('shoppingcart');
	    	//查找同goods_id同loginkey的数据
	    	$search['goods_id'] =$goods_id;
	    	$search['loginkey'] = $loginkey;
	    	$search['_logic'] = 'AND';
	    	$select = $Cart->where($search)->select();
	    	//若存在则数量+1
	    	if($select){
	    		$ret['goods_id']=$goods_id;
	    		$ret['loginkey']=$loginkey;	    		    		
	    		$amount = $Cart->where($search)->getField('amount');
	    		$ret['amount'] = intval($amount)+1;
	    		$Cart->where($search)->save($ret);
	    		echo json_encode(array('status'=>2,'row'=>$amount)); 
	    	}else{
	    		//若不存在则新插入一条购物车数据
	    		$ret['goods_id']=$goods_id;
	    		$ret['loginkey']=$loginkey;
	    		$ret['amount']=1;
	    		$Cart->add($ret);	
	    		echo json_encode(array('status'=>1,'row'=>$ret)); 
	    	}
	    	
	    }
	}
?>
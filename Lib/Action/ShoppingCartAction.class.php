<?php

class ShoppingCartAction extends Action {
    //获取goods表中获取已知编号的商品信息
    public function getGoodsInfo($goods_id){
        $search['goods_id']=$goods_id;
        $Goods = M('goods');
        $getdata = $Goods->where($search)->select();
        return $getdata;
    }
	
    //购物车页面接口
    public function shoppingcartInfo(){
        //获取用户的loginkey
        $user['loginkey'] = session('loginkey');
        //获取购物车表中的信息
        $ret = M('shoppingcart')->where($user)->select();
        $total=count($ret);
        foreach($ret as $key =>$val){
            $search['goods_id'] = $val['goods_id'];
            $Cart = M('goods');
            $price = $Cart->where($search)->getField('goods_price');
            $pic = $Cart->where($search)->getField('goods_pic');
            $name = $Cart->where($search)->getField('goods_name');
            $ret[$key]['goods_pic']=$pic;
            $ret[$key]['goods_name']=$name;
            $ret[$key]['goods_price']=$price;
        }
        $all = $this->calcutateAll();
        return array('row'=>$ret,'sumprice'=>$all);
    }
    //获取购物车信息
    public function getShoppingcart(){
        $ret = $this->shoppingcartInfo();
        echo json_encode($ret);
    }
    /*
        购物车商品改变商品数量接口
        type = 1 商品数量+1；
        type = 2 商品数量-1；
    */
    public function changeGoodsAmount(){
        $goods_id = I('post.goods_id');
        $value = session('loginkey');
        $type = I('post.type');
        $loginkey = $value;
        //实例化shoppingcart数据库对象
        $Cart = M('shoppingcart');
        //查找同goods_id同loginkey的数据
        $search['goods_id'] =$goods_id;
        $search['loginkey'] = $loginkey;
        $search['_logic'] = 'AND';
        // $select = $Cart->where($search)->select();
        //获取购物车该商品的数量
        $change['goods_id']=$goods_id;
        $change['loginkey']=$loginkey;                         
        $amount = $Cart->where($search)->getField('amount');
        if($type==1){
            //获取商品库存信息
            $goodsinfo = $this->getGoodsInfo($goods_id);
            $stock = $goodsinfo[0]['goods_stock'];
            /*
            比较库存数与欲购买数量
            status = 1 增加成功
            status = 2 库存不足，增加失败
            */
            if(intval($stock) > intval($amount)){
                $change['amount'] = intval($amount)+1;
                $Cart->where($search)->save($change);
                $sumprice = $this->calcutateAll();
                echo json_encode(array('status'=>1,'sumprice'=>$sumprice)); 
            }else{
                echo json_encode(array('status'=>2));
            }
        }else if($type==2){
            $change['amount'] = intval($amount)-1;
            $Cart->where($search)->save($change);
            $sumprice = $this->calcutateAll();
            echo json_encode(array('status'=>1,'sumprice'=>$sumprice)); 
        }
    }   
    /*
        删除购物车商品接口
        type = 1 删除指定编号商品
        type = 2 删除购物车内所有商品
    */
    public function deleteGoods(){
        $goods_id = I('post.goods_id');
        $value = session('loginkey');
        $type = I('post.type');
        $loginkey = $value;
        //实例化shoppingcart数据库对象
        $Cart = M('shoppingcart');
        $search['loginkey'] = $loginkey;
        if($type == 1){
            $search['goods_id'] =$goods_id;
            $search['_logic'] = 'AND';
            $ret = $Cart->where($search)->delete();
            $sumprice = $this->calcutateAll();
            echo json_encode(array('status'=>1,'sumprice'=>$sumprice)); 
        }else if($type == 2){
            $ret = $Cart->where(array('loginkey'=>$loginkey))->delete();
            echo json_encode(array('status'=>1,'sumprice'=>0)); 
        }
       
    }
    //计算购物车内的商品总价
    public function calcutateAll(){
        $loginkey = session('loginkey');
        $Cart = M('shoppingcart');
        $search['loginkey'] = $loginkey;
        $getdata = $Cart->where($search)->select();  
        $all = 0;
        foreach($getdata as $value){
            $goodsinfo = $this->getGoodsInfo($value['goods_id']);
            $price=$goodsinfo[0]['goods_price'];
            $all = $all + intval($price)*intval($value['amount']);
        }
        return $all;
    }

}

?>
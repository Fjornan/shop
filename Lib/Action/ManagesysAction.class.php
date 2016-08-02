<?php
class ManagesysAction extends Action {
    //首页页面
	public function login(){
        $postdata = I();
        //获取前端传过来的用户名和密码
        $search['username'] = $postdata['username'];
        $search['password'] = $postdata['password'];
        //判断用户名和密码是否能和数据库中的信息对应
        if(M('manageuser')->where($search)->find()){
            //对应则返回status=1
            echo json_encode(array('status'=>1));
        }else{
            //不对应则返回status=2
            echo json_encode(array('status'=>2));
        }
    }  
    /**********         
                            商品管理页面接口     
                                                        ************/
    //添加分类信息
    public function addAssortment(){
        //获取将要创建的分类名
        $ass_name = I('post.ass_name');
        /*****
            获取数据库中的已有分类名
            若已存在，则返回status =2
        *****/
        $getdata = M('assortment')->select();
        $status =1;
        foreach($getdata as $val){
            if($ass_name == $val['ass_name']){
                $status =2;
                break;
            }
        }
        //若不存在，则返回status =1，并将分组添加到数据库中
        if($status == 1){
            $data['ass_name'] = $ass_name;
            M('assortment')->add($data);
            $ret = M('assortment')->where($data)->find();
            //创建该分类的文件夹，用于存放图片
            mkdir("./Tpl/Public/image/goods/".$ret['goods_type'],0777);
        }
        echo json_encode(array('status'=>$status,'assortment'=>$ret));
    }
    //删除分类信息
    public function deleteAssortment(){
        //获取将要删除的分类
        $search['goods_type'] = I('post.goods_type'); 
        //删除数据库中该分类信息
        M('assortment')->where($search)->delete();
        //删除该分类文件夹和文件
        $dir = "./Tpl/Public/image/goods/".$search['goods_type'];
        //先删除目录下的文件：
        $dh=opendir($dir);
        while ($file=readdir($dh)) {
            if($file!="." && $file!="..") {
                $fullpath=$dir."/".$file;
                if(!is_dir($fullpath)) {
                    //删除文件
                    unlink($fullpath);
                } else {
                    deldir($fullpath);
                }
            }
        }
        closedir($dh);
        rmdir($dir);
        echo json_encode(array('status'=>'1'));
    }
    //获取商品信息
    public function getGoods(){
        //获取分类信息
        $goods_type = I('post.goods_type');
        //若goods_type为first，则返回数据库中第一种分类的商品
        if($goods_type == 'first'){
            $search['goods_type'] =1;
            $ret = M('goods')->where($search)->select();
            echo json_encode($ret);
        }else{
            //否则根据传入的分类值进行查询
            $search['goods_type'] =$goods_type;
            $ret = M('goods')->where($search)->select();
            if($ret == null){
                echo json_encode(array('status'=>2,'goods_type'=>$goods_type));
            }else{
                echo json_encode($ret);
            }   
        }
    }
    //获取对应id的商品信息
    public function getOneGoods(){
        $search['goods_id'] = I('post.goods_id');
        $ret =  M('goods')->where($search)->find();
        echo json_encode($ret);
    }
    //添加商品
    public function addGoods(){
        $postdata = I();
        $goods_type = I('get.goods_type');
        $goods_id = date('Ymd').$postdata['goods_id'];
        
        //获取上传的图片
        $file = $_FILES['file'];
        $picname = $_FILES['file']['name'];
        $type = strstr($picname, '.');
        if ($type != ".png" && $type != ".jpg") {
            echo "<script>alert('图片格式不对！')</script>";
            exit;
        }
        //设置图片存放的路径
        $goods_pic = "./Public/image/goods/".$goods_type.'/'.$goods_id.$type;
        //向数据库中插入数据
        $data['goods_id'] = $goods_id;
        $data['goods_type'] = $goods_type;
        $data['goods_pic'] = $goods_pic;
        $data['goods_name'] = $postdata['goods_name'];
        $data['goods_stock'] = $postdata['goods_stock'];
        $data['goods_price'] = $postdata['goods_price'];
        $data['goods_instruction'] = $postdata['goods_instruction'];
        $result = M('goods')->add($data);
        //若数据插入成功则将图片保存在本地
        if($result!= false){
            $pic_path = "./Tpl".substr($goods_pic, 1);
            move_uploaded_file($_FILES['file']['tmp_name'], $pic_path);
        }
        // echo json_encode(array('postdata'=>$postdata,'file'=>$pic_path));
        $this->display('Managesys/goodsmanage');
    }
    //删除商品
    public function deleteGoods(){
        $search['goods_id']=I('post.goods_id');
        M('goods')->where($search)->delete();
        echo json_encode(array('status'=>1));
    }
    //修改商品基本信息
    public function updateGoods(){
        $postdata = I();
        $search['goods_id'] = $postdata['goods_id'];
        M('goods')->where($search)->save($postdata);
        $this->display('Managesys/goodsmanage');
    }

/**********         
                        订单管理页面接口     
                                                    ************/
    //获取订单信息
    public function getOrder(){
        //获取传入的订单状态信息
        $order_status = I('post.order_status');
        $isdelivery = I('post.isdelivery');
        $search['order_status'] = $order_status;
        if($order_status == 2){
            $search['isdelivery'] = $isdelivery;
            $search['_logic'] = 'AND';
        }
        //在数据库中查询订单信息
        $ret = M('order')->where($search)->group('order_id')->order('order_begin')->select();
        foreach ($ret as $key => $val) {
            $search['loginkey'] = $val['loginkey'];
            $ret[$key]['username'] = M('user')->where($search)->getField('username');
        }
        echo json_encode($ret);
    }
    //获取订单中下单商品信息
    public function getOrderGoods(){
        //获得订单id好
        $search['order_id'] = I('post.order_id');
        //查询
        $ret = M('order')->where($search)->select();
        foreach ($ret as $key => $val) {
            $search['goods_id'] =  $val['goods_id'];
            $ret[$key]['goods_pic'] = M('goods')->where($search)->getField('goods_pic');
        }
        echo json_encode($ret);
    }
    //删除订单
    public function deleteOrder(){
        $search['order_id'] = I('post.order_id');
        M('order')->where($search)->delete();
        echo json_encode(array('status'=>1));
    }
    //修改订单状态，改为已发货状态
    public function changeOrderStatus(){
        $search['order_id'] = I('post.order_id');
        $data['isdelivery'] = 2;
        M('order')->where($search)->save($data);
        echo json_encode(array('status'=>1));
    }

    /***************
                        用户管理           
                                        ********************/
    //获取用户信息
    public function getUser(){
        $ret = M('user')->select();
        echo json_encode($ret);
    }
    //更改用户权限
    public function changeUserStatus(){
        //获取用户id号
        $user_id = I('post.loginkey');
        $search['loginkey'] = $user_id;
        $getdata = M('user')->where($search)->find();
        //判断用户现在的状态 1为普通用户，2为会员用户
        if($getdata['user_status'] == 1){
            $data['user_status'] =2;
        }else if($getdata['user_status'] == 2){
            $data['user_status']=2;
        }
        //更改用户权限
        M('user')->where($search)->save($data);
    }



}


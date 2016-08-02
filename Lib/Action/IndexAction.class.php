<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends Action {
	//定义跳转的主页
    public function index(){
        //获取access_token
        // $data['access_token'] = $wechatObj->get_access_token();
        // M('access')->add($data);
        // $wechatObj->responseMsg(); 

        // //获取code
        // $code =  $_GET['code'];
        // //获取access和openid
        // $url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx0b75fd4c1abe3a99&secret=c43c0d74ea3002f8ce90f9c62dc96807&code=".$code."&grant_type=authorization_code";
        // $result = $this->https_request($url);
        // $jsoninfo = json_decode($result, true);
        // $access_token = $jsoninfo["access_token"];
        // $openid = $jsoninfo["openid"];
        // //获取用户信息
        // $url = "https://api.weixin.qq.com/sns/userinfo?access_token=".$access_token."&openid=".$openid;
        // $result = $this->https_request($url);
        // $userinfo = json_decode($result, true);
        // $loginkey = $userinfo['openid'];
        // $pic_url = $userinfo['headimgurl'];
        // $data['loginkey'] = $userinfo['openid'];
        // $data['username'] = $userinfo['nickname'];
        // $data['user_pic'] = './Public/image/userpic/'.$loginkey.'.jpg';
        // M('user')->add($data);
        // // 下载用户头像
        // $return_content = $this->http_get_data($pic_url);
        // $filename = './Tpl/Public/image/userpic/'.$loginkey.'.jpg';
        // $fp= @fopen($filename,"a"); //将文件绑定到流  
        // fwrite($fp,$return_content); //写入文件


        session('loginkey','orseWv4iA8crbE52STgZX1i11ya4');
        //获取用户身份
        $user_status = M('user')->where(array('loginkey'=>session('loginkey')))->getField('user_status');
        session('user_status',$user_status);
        $this->display('index');
    }
    //热门推荐接口
    public function hotRecommend(){
    	$ret = M('goods')->where('goods_status = 1')->select();
    	$total = count($ret);
		echo json_encode($ret);    	
    }
    //卡券领取接口
    /*
        1：普通用户可见
        2：会员用户可见
    */
    public function getCoupon(){
        $user_status = session('user_status');
        if($user_status == 1){
            $search['coupon_type']=1;
            $ret = M('coupon')->where($search)->select();
        }else if($user_status == 2){
            $ret = M('coupon')->select();
        }
        
        foreach($ret as $key => $val){
            //返回json加入优惠详情
            $full = $ret[$key]['coupon_full'];
            $cut = $ret[$key]['coupon_cut'];
            $coupon_detail = "满".strval($full)."减".strval($cut)."元";
            $ret[$key]['coupon_detail'] = $coupon_detail;
            //查找该优惠券是否已被用户拥有
            $search['loginkey']=session('loginkey');
            $search['coupon_id']= $ret[$key]['coupon_id'];
            $search['_logic'] = 'AND';
            if(M('mycoupon')->where($search)->select()){
                unset($ret[$key]);
            }
        }
        echo json_encode($ret);
    }
    /*
        添加卡券功能
    */
    public function addCoupon(){
        $data['coupon_id'] = I('post.coupon_id');
        $data['loginkey'] = session('loginkey');
        $ret = M('mycoupon')->add($data);
        echo json_encode(array('status'=>1));
    }
        //微信接口数据传输的万能函数
    public function https_request($url, $data = null){
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        if (!empty($data)){
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($curl);
        curl_close($curl);
        return $output;
    }
    //下载图片
    public function http_get_data($url) {
        $ch = curl_init ();
        curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, 'GET' );
        curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, false );
        curl_setopt ( $ch, CURLOPT_URL, $url );
        ob_start ();
        curl_exec ( $ch );
        $return_content = ob_get_contents ();
        ob_end_clean ();
        
        $return_code = curl_getinfo ( $ch, CURLINFO_HTTP_CODE );
        return $return_content;
    }
}

?>
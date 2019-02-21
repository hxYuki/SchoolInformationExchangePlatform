<?php
namespace app\index\controller;

use think\Controller;
use think\Request;
class User extends Controller
{
    public $request;
    public $model;
    public function _initialize()
    {
        parent::_initialize();
        header('Access-Control-Allow-Origin: http://localhost:8080');
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, authKey, sessionId");
        $this->request=Request::instance();
        $this->model=model('User');
    }
    public function checkRepetation()
    {
        
        $checkField=$this->request->param('checkField');
        $checkValue=$this->request->param('checkValue');

        
        $res="";
        switch($checkField)
        {
            case 'nickname':
                $res=$this->model->checkRepeatName($checkValue);
            break;
            case 'id':
                $res=$this->model->checkRepeatId($checkValue);
            break;
        }
        return $res;
    }
    public function register()
    {
        $req="";$res="";
        $req=json_decode(json_encode($this->request->param()),true);
        
        if(!$req) return "NO DATA";
        
        $req['ip']=$this->request->server('REMOTE_ADDR');
        // var_dump($things);exit;
        $res=$this->model->uRegister($req);
        
        return $res;
    }
    public function login()
    {
        $req="";$res="";
        $req=json_decode(json_encode($this->request->param()),true);

        if(!$req) return "NO DATA";

        $req['ip']=$this->request->server('REMOTE_ADDR');

        $res=$this->model->uLogin($req);
        if($res)
            return $res;
        else
            return 'FAULT';
    }
    public function getUser($type)
    {
        $req='';$res='';$ret='';
        $req=$this->request->param('userId');
        if(!$req) return 'no data';

        switch ($type)
        {
            case 'seller':
                $res=$this->model->getUserAsSeller($req);
                if($res['user_comments']>0)
                {
                    $commentModel=model('Comment');
                    $res['comments']=$commentModel->getComments($req);

                    foreach ($res['comments'] as &$c) {//process anonymous user's comment
                        if($c['is_anonymous']===1){
                            unset($c['by_id']);
                            $c['by_name']=substr_replace($c['by_name'],'*',1,-1);
                        }
                    }
                }
                break;
        }

        return json_encode($res);
    }
}
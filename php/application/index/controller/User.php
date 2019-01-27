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
        $str=$this->request->param('regdata');
        if(!$str) return false;
        
        $things=json_decode($str,true);
        $things['ip']=$this->request->server('REMOTE_ADDR');
        // var_dump($things);exit;
        $res=$this->model->register($things);

        return $res;
    }
}
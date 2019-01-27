<?php
namespace app\index\controller;

use think\Controller;
use think\Request;
class User extends Controller
{
    public function checkRepetation()
    {
        header("Access-Control-Allow-Origin: http://localhost:8080");
        header('Access-Control-Allow-Methods: GET, POST');
        header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Accept, http://localhost:8080");

        $r=Request::instance();
        $checkField=$r->param('checkField');
        $checkValue=$r->param('checkValue');

        $m=model('User');
        $res="";
        switch($checkField)
        {
            case 'nickname':
                $res=$m->checkRepeatName($checkValue);
            break;
            case 'id':
                $res=$m->checkRepeatId($checkValue);
            break;
        }
        return $res;
    }
}
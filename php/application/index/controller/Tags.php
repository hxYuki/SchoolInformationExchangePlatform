<?php
namespace app\index\controller;

use think\Controller;
use think\Request;

class Tags extends Controller
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
        $this->model=model('Tags');
    }

    public function getTags()
    {
        $res='';$req='';$ret="";
        $req=$this->request->param('query');
        if($req==='')
            $res=$this->model->getCommonTags();
        else
            $res=$this->model->getSuggestTags($req);

        foreach ($res as $key => $value) {
            $ret.=($value['tagname'].',');
        }
        $ret=mb_substr($ret,0,-1);
        return $ret;
    }
    public function insertTag()
    {
        
    }
}
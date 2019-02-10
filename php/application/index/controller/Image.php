<?php
namespace app\index\controller;

use think\Controller;
use think\Request;
use app\common\FileTypeValidation;
class Image extends Controller
{
    public $model;
    public $request;
    public $path;
    public function _initialize()
    {
        parent::_initialize();
        header('Access-Control-Allow-Origin: http://localhost:8080');
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, authKey, sessionId");
        $this->model=model('Image');
        $this->request=Request::instance();
        $this->path=ROOT_PATH . 'public' . DS . 'uploads';
    }
    public function imageCollect()
    {
        $r=Request::instance();
        $m=model('Image');

        $type="";$res="";
        if($rawImg=$r->file('stuCard')){
            $type='stuCard';
        }elseif($rawImg=$r->file('itemPic')){
            $type='itemPic';
        }
        // elseif($rawImg=$r->file('stuCard'))  //other image upload name
        // {
        // }

        if(!$rawImg) return 'No data posted';  //empty 
        
        
        $info = $rawImg->validate(['size'=>1024*1024*2,'ext'=>'jpg,png,gif,jpeg'])->rule('sha1')->move($this->path);
        if(!$info) return $info->getError();  //move error

        $savename=$info->getSavename();
        if(!$this->validateFileType($this->path .DS. $savename,'jpg,png,gif,jpeg'))
        {
            unset($info);
            unlink($this->path .DS. $savename);
            return 'Non-image type';  //not s image
        }
        $res=$m->newImage($savename,$type);
        return $res;  //return image id
    }
    private function validateFileType($file,$extstr)
    {
        $v=FileTypeValidation::instance();
        $exts=explode(',',$extstr);
        foreach ($exts as $key => $ext) {
            if($v->validation($file,$ext))
                return true;
        }
        return false;
    }
    public function imageRemove()
    {
        $req="";$res="";$ret="";
        $req=$this->request->param('imgId');
        if(!$req) return 'no data';
        $count=$this->model->getRepeatImageNum($req);
        if($count==0) return 'no data';
        if(\is_string($count))
        {
            unlink($this->path .DS. $count);
        }
        $res=$this->model->deleteImage($req);
        if($res==0) return 'not deleted';
        else return 'ok';
    }
}
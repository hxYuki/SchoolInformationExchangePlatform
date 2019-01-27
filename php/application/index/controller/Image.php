<?php
namespace app\index\controller;

use think\Controller;
use think\Request;
use app\common\FileTypeValidation;
class Image extends Controller
{
    public function imageCollect()
    {
        header('Access-Control-Allow-Origin: http://localhost:8080');
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, authKey, sessionId");

        $r=Request::instance();
        $m=model('Image');

        $type="";$res="";
        if($rawImg=$r->file('stuCard'))
        {
            $type='stuCard';
        }
        // elseif($rawImg=$r->file('stuCard'))  //other image upload name
        // {
        // }

        if(!$rawImg) return 'No data posted';  //empty 
        $path=ROOT_PATH . 'public' . DS . 'uploads';
        
        $info = $rawImg->validate(['size'=>1024*1024*2,'ext'=>'jpg,png,gif,jpeg'])->rule('sha1')->move($path);
        if(!$info) return $info->getError();  //move error

        $savename=$info->getSavename();
        if(!$this->validateFileType($path .DS. $savename,'jpg,png,gif,jpeg'))
        {
            unset($info);
            unlink($path .DS. $savename);
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
}
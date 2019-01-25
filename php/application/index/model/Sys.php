<?php
namespace app\Sys\model;

use think\Model;

class Sys extends Model
{
    public function getSysInfo()
    {
        $data=$this->table('dl_system_config')->select();
        return $data;
    }
    public function getOptions()
    {
        $data=$this->table('dl_system_homepage_options')->select();
        return $data;
    }
}


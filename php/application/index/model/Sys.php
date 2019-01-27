<?php
namespace app\index\model;

use think\Model;

class Sys extends Model
{
    public function getLocation()
    {
        $data=$this->table('sp_system')->value('locations');
        return $data;
    }
    public function getOptions()
    {
        $data=$this->table('dl_system_homepage_options')->select();
        return $data;
    }
}


<?php
namespace app\index\model;

use think\Model;

class Tags extends Model
{
    public function getCommonTags()
    {
        $data='';
        $data=$this->table('sp_item_tag')->field('tagname')->order(['use'=>'desc'])->limit(10)->select();
        return json_decode(json_encode($data),true);
    }
    public function getSuggestTags($query)
    {
        $data='';
        $data=$this->table('sp_item_tag')->field('tagname')->bind(['qu'=>'%'.$query.'%'])->where('tagname like :qu')->order(['use'=>'desc'])->limit(10)->select();
        return json_decode(json_encode($data),true);
    }
    public function updateNInsertTag($tag)
    {
        $d=0;
        if($this->table('sp_item_tag')->where('tagname',$tag)->value('tagname')){
            $d=$this->table('sp_item_tag')->where('tagname',$tag)->setInc('use');
        }else{
            $d=$this->table('sp_item_tag')->insert(['tagname'=>$tag,'use'=>1]);
        }
        return $d;
    }
}
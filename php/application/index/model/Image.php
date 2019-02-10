<?php
namespace app\index\model;
use think\Model;

class Image extends Model
{
    /**
     * this save image into database
     * @author ORIGIN
     * @param string Url getting the image
     * @param int Image type
     * @return int Image Id
     */
    public function newImage($imgUrl,$type)
    {
        $d=[
            'type'=>$type,
            'url'=>$imgUrl
        ];
        $this->table('sp_images')
            ->insert($d);
        return $this->table('sp_images')->getLastInsID();
    }
    public function deleteImage($imgId)
    {
        return $this->table('sp_images')->where('id',$imgId)->delete();
    }
    public function getRepeatImageNum($imgId)
    {
        $imgUrl=$this->table('sp_images')->where('id',$imgId)->value('url');
        $count=$this->table('sp_images')->where('url',$imgUrl)->count();

        if($count==1)
            return $imgUrl;
        else return $count;
    }
}
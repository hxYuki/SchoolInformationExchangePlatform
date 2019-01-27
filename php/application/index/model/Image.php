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
}
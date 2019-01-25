<?php
namespace app\index\model;
use think\Model;

class ImageAdd extends Model
{
    /**
     * this save image into database
     * @author ORIGIN
     * @param string Url getting the image
     * @param int Image type
     * @return int Image Id
     */
    public function NewImage($imgUrl,$type)
    {
        $d=[
            'img_type'=>$type,
            'img_url'=>$imgUrl
        ];
        $this->table('dl_map_image')
            ->insert($d);
        return $this->table('dl_map_image')->getLastInsID();
    }
}
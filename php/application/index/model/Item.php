<?php
namespace app\index\model;
use think\Model;
use think\Db;
class Item extends Model
{
    /**
     * this return all item on sale
     * @author ORIGIN
     * @param int page number
     * @param array if you want to search someting, eg:
     *                  'item_name'
     *                  'item_description'
     *                  'item_seller_id'
     *                  'item_tag'
     * @param array of string in['newest'|'hottest'|'cheapest'](single or multiple) determine the order to show
     * @param array of boolean if reverse all results
     * @return array array of items
     */
    public function getList($page,$searchKeyWord='',$order=[])
    {
        $map=[
            'is_del'=>0,
            'is_outofdate'=>0,
            'type'=>'sale'
        ];
        if($searchKeyWord)
            $map['title|tags']=['like','%'.$searchKeyWord.'%'];
        
        
        $field=[
            'id',
            'title',
            'description',
            'publisher_id',
            'images',
            'price',
            'tags',
            'publish_time',
            'view'
        ];
        $perPageNum=15;

        $list['list']=$this
            ->table('sp_item')
            ->field($field)
            ->where($map)
            ->page($page,$perPageNum)
            ->order($order)
            ->select();
        $list['list_count']=$this
            ->table('sp_item')
            ->where($map)
            ->count();
        return $list;
    }
    // public function getList($page,$searchMethod,)
    // {
    //     # code...
    // }
    /**
     * this return specific item's information
     * @author ORIGIN
     * @param int item's ID
     * @return array KV pair of item information
     */
    public function getItem($itemId)
    {
        $map['id']=$itemId;$map['type']='sale';
        
        $this->table('sp_item')->where($map)->setInc('view');
        $data=$this
            ->table('sp_item')
            ->where($map)
            ->find();
        
        return $data;
    }
    /**
     * this add item in database
     * @author ORIGIN
     * @param array item's information
     * @return int|string (success)item id | (fail)'ERR'
     */
    public function putItem($infos)
    {
        $d=[
            'title'=>$infos['itemName'],
            'description'=>$infos['description'],
            'publisher_id'=>$infos['sellerId'],
            'images'=>$infos['imageCollects'],
            'tags'=>$infos['tagId'],
            'price'=>$infos['price'],
            'type'=>$infos['type']
        ];

        $r=$this->table('sp_item')
            ->insert($d);
        if($r==1)
            return $this->table('sp_item')->getLastInsID();
        else
            return 'ERR';
    }
    /**
     * this update item's information
     * @author ORIGIN
     * @param array item's new information(this could be incomplete)
     * @return string (success)'OK' | (fail)'ERR'
     */
    public function updateItem($infos)
    {
        $d;
        foreach ($infos as $key => $value) {
            switch($key)
            {
                case'itemId':
                    $d['item_id']=$value;
                case'itemName':
                    $d['item_name']=$value;
                case'itemDiscription':
                    $d['item_discription']=$value;
                case'imageCollects':
                    $d['item_image']=$value;
                case'tagId':
                    $d['item_tag']=$value;
                case'price':
                    $d['item_price']=$value;
            }
        }
        $r=$this->table('dl_item')
            ->update($d);

        if($r)
            return 'OK';
        else
            return 'ERR';
    }
    /**
     * when an item is sold or deleted, hide it
     * @author ORIGIN
     * @param int item's ID
     * @param string 'deleted' or 'sold' , you should guarantee the string must be the former two
     * @return int 1 for success, 0 for fault
     */
    public function hideItem($itemId,$reason)
    {
        $map['item_id']=$itemId;
        switch($reason)
        {
        case 'deleted':
            $d['is_del']=1;
            break;
        case 'sold':
            $d['is_sold']=1;
            break;
        }
        return $this->table('dl_item')->where($map)->update($reason);
    }
}
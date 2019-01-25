<?php
namespace app\user\model;

use think\Model;
use think\common;

/**
 * all base users' functions
 */
trait BaseUser
{
    /**
     * this presents check for user logging in
     * @author ORIGIN
     * @param int user's ID
     * @param string user's PASSWORD
     * @return boolean|string check result or resons why cannot login
     */
    public function login($userId,$userPwd)
    {
        $ori=$this->table('dl_user')->where('user_id',$userId)->field('user_password,_pwd_salt')->select();
        if($ori)
        {
            $pwd=$ori['user_password'];
            $salt=$ori['_pwd_salt'];
            $userPwd=hash("sha256",$userPwd.$salt);
            
            if($pwd==$userPwd)
                return true;
            else return 'wrong pwd';
        }
        else return 'wrong id';
    }
    /**
     * this execute process inserting new users
     * @author ORIGIN
     * @param array this should be user's input in forms
     * @return int new user's id
     */
    public function register($infoList)
    {
        $salt=create_salt();
        $pwd=hash("sha256",$infoList['user_password'].$salt);
        $data=[
            'user_password'=>$pwd,
            'user_nickname'=>$infoList['user_nickname'],
            'user_location'=>$infoList['user_location'],
            '_pwd_salt'=>$salt
        ];
        $this->table('dl_user')->insert($data);
        return $this->table('dl_user')->getLastInsID();
    }
    /**
     * this will check how many same names in database
     * @author ORGIN
     * @param string user's input name
     * @return int the number of names
     */
    public function checkRepetition($userNickName)
    {
        $data=$this->table('dl_user')->where('user_nickname',$userNickName)->count();
        return $data;
    }
}

class User extends Model implements IUser
{
    use BaseUser;
    /**
     * this return given user's basic infomation
     * @author ORIGIN
     * @param int user's ID
     * @return array user's basic infomation
     */
    public function getUserInfo($userId)
    {
        $map['user_id']=$userId;
        $condition=['dl_seller','dl_seller.seller_id=user_id'];
        $field=[
            'user_id',
            'user_nickname',
            'user_location',
            'seller_history',
            'user_is_seller',
            'user_is_verified',
            '_hide_detail'
        ];
        $data=$this->table('dl_user')->join($condition)->field($field)->where($map)->select();
        return $data;
    }
    /**
     * this returns given user's detail,second parameter decides query's result
     * @author ORIGIN
     * @param int user's ID
     * @param boolean if you want HistoryOnly Mode
     * @return array query result
     */
    public function getUserDetail($userId,$onlyHistory)
    {
        $map['user_id']=$userId;
        if($onlyHistory) $field=['user_history'];
        else $field=['user_realname','user_stu_id','user_history'];
        $data=$this->table('dl_user_detail')->field($field)->where($map)->select();
        return $data;
    }
    
    /**
     * when user apply to verify his account
     * @author ORIGIN
     * @param array user's input in form
     * @return int 0 for fault and 1 for success
     */
    public function toVerify($infoList)
    {
        $data=[
            'verify_user_id'=>$infoList['user_id'],
            'verify_realname'=>$infoList['user_realname'],
            'verify_stu_id'=>$infoList['user_stu_id']
        ];
        $r=$this->table('dl_user_vetify')->insert($data);
        if($r)
        {
            $r=$this->table('dl_user')->where('user_id',$infoList['user_id'])->update(['user_is_verified'=>'1']);
            return $r;
        }
        return $r;
    }
    /**
     * when a user apply to be a seller
     * @author ORIGIN
     * @param int user's ID
     * @return int 0 for fault and 1 for success
     */
    public function beSeller($userId)
    {
        $r=$this->table('dl_user')->where('user_id',$userId)->update(['user_is_seller'=>'1']);
        return $r;
    }
}
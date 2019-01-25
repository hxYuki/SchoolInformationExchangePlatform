<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * this generate salt for sha256 encoding user's password
 * @author ORIGIN
 * @param int this is optional, controlling length of this salt
 * @return string random salt for encoding
 */
function create_salt($length = 30)  
{
    $randstr = ""; 
    for ($i = 0; $i < $length; $i++) 
    { 
        $randstr .= chr(mt_rand(33, 126)); 
    } 
    return $randstr; 
} 


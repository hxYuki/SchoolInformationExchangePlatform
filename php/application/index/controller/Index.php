<?php
namespace app\index\controller;

use think\Controller;
use think\Request;
class Index extends Controller
{
    public function miss()
    {
        return 'page missing';
    }

    public function test($r)
    {
        header("Access-Control-Allow-Origin: http://localhost:8080");
        header('Access-Control-Allow-Methods: GET, POST');
        header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Accept, http://localhost:8080");
        
        $p=\explode('.',$r);
        var_dump(isset($p[3]));exit;
    }

}

<?php
namespace app\index\controller;

use think\Controller;

class System extends Controller
{
    public function location()
    {
        header("Access-Control-Allow-Origin: http://localhost:8080");
        header('Access-Control-Allow-Methods: GET, POST');
        header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Accept, http://localhost:8080");
        $m=model('Sys');

        $locations=$m->getLocation();
        $l=explode(',',$locations);
        return json_encode($l);
    }
}
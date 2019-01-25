<?php
namespace app\index\controller;

class Index
{
    public function miss()
    {
        return 'page missing';
    }

    public function greet()
    {
        header("Access-Control-Allow-Origin: http://localhost:8080");
        header('Access-Control-Allow-Methods: GET, POST');
        header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Accept, http://localhost:8080");
        return 'hi projecter';
    }
}

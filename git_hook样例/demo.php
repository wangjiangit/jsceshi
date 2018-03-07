<?php

$server_path = '/web/www/ejivc_server';
$ref = 'master';
$log_path = './ejivc_deploy.log';

$valid_token = '0abf11f0681be7cbf444afe4758459f32be5662ec';
$valid_ip = array('120.55.80.182');

$client_token = $_GET['token'];
$client_ip = $_SERVER['REMOTE_ADDR'];

$fs = fopen($log_path, 'a');
fwrite($fs, 'Request on ['.date("Y-m-d H:i:s").'] from ['.$client_ip.']'.PHP_EOL);

// check token
if ($client_token !== $valid_token)
{
    echo "token is need";
    fwrite($fs, "Invalid token [{$client_token}]".PHP_EOL);
    exit(0);
}

// check ip
if (!in_array($client_ip, $valid_ip))
{
    echo "ip: ".$client_ip." is not permission";
    fwrite($fs, "Invalid ip [{$client_ip}]".PHP_EOL);
    exit(0);
}


$json = file_get_contents('php://input');
$data = json_decode($json, true);
fwrite($fs, 'Data: '.print_r($data, true).PHP_EOL);

if(isset($data['ref']) && $data['ref']=='refs/heads/'.$ref){
    $output=shell_exec("cd {$server_path} && /usr/local/git/bin/git checkout {$ref} && /usr/local/git/bin/git pull origin {$ref} 2>&1");
    fwrite($fs, 'Info: '. $output.PHP_EOL);
}else{
    fwrite($fs, $data['ref'].' undefind'.PHP_EOL);
}

fwrite($fs, '======================================================================='.PHP_EOL);
$fs and fclose($fs);

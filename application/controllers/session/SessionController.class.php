<?php

class SessionController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	
    }	

    public function httpPostMethod(Http $http, array $formFields)
    {
    	
    	$order = $_POST['order'];
    	$json = json_decode($order, true);
    	$_SESSION['order'] = $json;
    	echo true;
    	die();
    	
    }
}
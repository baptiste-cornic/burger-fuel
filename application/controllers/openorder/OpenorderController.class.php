<?php

class OpenorderController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	
        $model = new ProductModel();
    	$firstproduct = $model->getFirstProduct();
        
    	$json2 = json_encode($firstproduct);
    	echo $json2;
    	die();
    	
  
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
    	
    	 
    	
    }
}
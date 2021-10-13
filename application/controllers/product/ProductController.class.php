<?php

class ProductController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	$id = $_GET['id'];
    	  
        // dans un aure fichier
        $model = new ProductModel();
    	$product = $model->getOneProduct($id);
        
    	$json = json_encode($product);
    	echo $json;
    	die();
  
    	 
    }

   
}
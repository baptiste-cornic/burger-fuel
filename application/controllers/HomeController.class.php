<?php

class HomeController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	
    	 
    	 $model = new ProductModel;
    	 $products = $model->getAllProducts();
    	 
    	 return [ 'products' => $products ];
    	
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
    	
    	 
    	
    }
}
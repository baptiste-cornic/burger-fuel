<?php

class OrderController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        if( isset($_SESSION['connected']) == false )
    	{
    	    $http->redirectTo('/login');
    	    die();
    	}
    	
        $model = new ProductModel;
    	$products = $model->getProductsName();

        return [ 'products' => $products ];  
    
    }

}
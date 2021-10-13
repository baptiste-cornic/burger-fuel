<?php

class ReceiptController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        
        if( isset($_SESSION['connected']) == false )
    	{
    	    $http->redirectTo('/login');
    	    die();
    	}
 
        $model = new ReceiptModel();
        $model -> insert($_SESSION['user']['id'], $_SESSION['total']);
    
    }

   
}
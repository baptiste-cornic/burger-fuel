<?php

class ConfirmController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        if( isset($_SESSION['connected']) == false )
    	{
    	    $http->redirectTo('/login');
    	    die();
    	}
       
       
         $result = 0;
         for($i = 0; $i < count($_SESSION['order']); $i++)
         {
             $quantity = intval($_SESSION['order'][$i]['quantity']);
             $price = intval($_SESSION['order'][$i]['price']);
             $result += $price * $quantity;
             
         }
         $_SESSION['total'] = $result;
         
         return ['result' => $result];
         
        
        
    }

}
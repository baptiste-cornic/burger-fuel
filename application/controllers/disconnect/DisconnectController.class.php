<?php

class DisconnectController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
       
        session_destroy();
    	$http->redirectTo('/');
    	die();
    
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
        
        
         
       
    	

    }
}
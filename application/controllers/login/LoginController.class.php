<?php

class LoginController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
       
        if( isset($_SESSION['connected']) == true )
    	{
    	    $http->redirectTo('/');
    	    die();
    	}
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
        if( isset($_SESSION['connected']) == true )
    	{
    	    $http->redirectTo('/');
    	    die();
    	}
    	
        $email = $_POST['email'];
        $password = $_POST['password'];
        
        $model = new UserModel;
        $user = $model->getUser($email,$password);
        
           
        if(empty($user))
        {
            return ['error' =>'Identifiants invalides'];
        }
        else 
        {
            //session storage marche pas
            
            $_SESSION["connected"] = true;
            
            $_SESSION['user'] = $user;
           
            $http->redirectTo('/');
            
        }
        
         
       
    	

    }
}
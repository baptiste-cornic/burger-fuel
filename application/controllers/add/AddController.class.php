<?php

class AddController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        if( isset($_SESSION['connected']) == false )
    	{
    	    $http->redirectTo('/login');
    	    die();
    	}	
    }	

    public function httpPostMethod(Http $http, array $formFields)
    {
        if( isset($_SESSION['connected']) == false )
    	{
    	    $http->redirectTo('/login');
    	    die();
    	}	
    	
    	$allowed_extension = ['image/png', 'image/bmp', 'image/jpeg'];
    	$type = $_FILES['photo']['type'];
    	
    	if( in_array($type , $allowed_extension) == true )
    	{
    	    $extension = pathinfo( $_FILES['photo']['name'], PATHINFO_EXTENSION);
    	    $filename = $_POST['name'].'.'.$extension;
    	    move_uploaded_file(
        	    $_FILES['photo']['tmp_name'], 
        	    WWW_PATH.'/images/meals/'.$filename);
        	 
        	//var_dump($_POST);
    	    //var_dump($_FILES);
    	    //var_dump($filename);
    	    //var_dump($extension);
    	    
    	    $model = new ProductModel();
    	    $product = $model->insert($_POST['name'], $_POST['description'], $_POST['price'], $filename);
    	    
    	    $http->redirectTo('/');

        	    
    	}
    	
    	
    	
    
    	
    }
}
<?php

class RegistrationController
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
    	
        $post = $_POST;
        $user_array = [];
        $firstname = $post['firstname'];
        $lastname = $post['lastname'];
        $day = $post['day'];
        $month = $post['month'];
        $year = $post['year'];
        $date = [$year,$month, $day ];
        $birthday = implode('-',$date);
        $address = $post['address'];
        $city = $post['city'];
        $post_code = $post['post_code'];
        $country =$post['country'];
        $phone = $post['phone'];
        $email = $post['email'];
        $password = $post['password'];
        
        
        if (empty($firstname))
        {
        	$wrong_firstname = '<p>Le champ firstname est requis. </p>';
            array_push($user_array, $wrong_firstname);
        }
        
        
        if (empty($lastname)) 
        {
        	$wrong_lastname = '<p>Le champ lastname est requis. </p>';
            array_push($user_array, $wrong_lastname);
        }
        
        if (empty($address))
        {
        	$wrong_address = '<p>Le champ address est requis. </p>';
            array_push($user_array, $wrong_address);
        }
      
        
        if (empty($city)) 
        {
        	$wrong_city = '<p>Le champ city est requis. </p>';
        	array_push($user_array, $wrong_city);
        }
        
        if (empty($post_code))
        {
        	$wrong_post_code = '<p>Le champ post code est requis. </p>';
        	array_push($user_array, $wrong_post_code);
        }
        
        if (empty($country))
        {
        	$wrong_country = '<p>Le champ country est requis. </p>';
        	array_push($user_array, $wrong_country);
        }
       
        if (empty($phone))
        {
        	$wrong_phone = '<p>Le champ phone est requis. </p>';
        	array_push($user_array, $wrong_phone);
        }
        
        if (empty($email))
        {
        	$wrong_email = '<p>Le champ email est requis. </p>';
        	array_push($user_array, $wrong_email);
        }
        
        if (empty($password))
        {
        	$wrong_password = '<p>Le champ password est requis. </p>';
        	array_push($user_array, $wrong_password);
        }
        
        // mdp 8 mini et post code de 5
        
        if(strlen($password) < 8){
            $short_password = '<p>Le champ Mot de passe doit avoir au moins 8 caractère(s). </p>';
        	array_push($user_array, $short_password);
        }
        
        if(strlen($post_code) != 5){
            $length_post_code = '<p>Le champ post code doit avoir 5 caractère(s). </p>';
        	array_push($user_array, $length_post_code);
        }
        
        
        if(!empty($user_array)){
            return ['user_array' => $user_array];   
        }
        
        
        try
        {
            $model = new UserModel;
            $model->insertUser($firstname, $lastname, $birthday, $address, $city, $post_code,
                                                $country, $phone, $email, $password);
                                                
            $http->redirectTo('/');
        }
        catch(Exception $e)
        {
            $message = $e->getMessage();
            array_push($user_array, $message);
        }
        
        if(!empty($user_array)){
            return ['user_array' => $user_array];   
        }
        
        
        
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */

    }
}
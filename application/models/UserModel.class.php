<?php
    
    class UserModel
    {
        public function insertUser($firstname, $lastname, $birthday, $address, $city, $post_code, $country, $phone, $email, $password )
        {
            $model = new SQLModel();
            $pdo = $model->getDatabase();
            
            $sql = 'SELECT email FROM users WHERE email = ?';
            $query = $pdo->prepare($sql);
            $query->execute([$email]);
            $user = $query->fetch();
            if( $user != null )
            {
                throw new Exception('Email deja utilisé');
            }
            
            
            $model = new SQLModel();
            $pdo = $model->getDatabase();
            
            $sql= " INSERT INTO 
            users(firstname, lastname, date_of_birth, address, city, post_code, country, phone, email, password )
            VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ";
            
             $hash = $this->hashPassword($password);
            
            $query = $pdo->prepare($sql);
            $query->execute([ $firstname, $lastname, $birthday, $address, $city, $post_code, $country, $phone, $email, $hash ]);
            
        }
        
        public function getUser($email, $password)
        {
            $model = new SQLModel();
            $pdo = $model->getDatabase();
            $sql ='SELECT *
                            FROM users
                            WHERE email = ?
                            ';
            $query = $pdo->prepare($sql);
            $query->execute([ $email ]);        
            $user = $query->fetch();
            
            if($user == null) 
            {
                return null;
            }
            
            $hash = $user['password'];
            
            // crypt : si vous donnez un hash qui contient un sel ( comme avec bcrypt ) : PHP extrait le sel et l'utilise
            // Est-ce que le mot de passe spécifié est correct par rapport à celui stocké ?
            if( crypt($password, $hash) == $hash )
            {
                return $user;
            }
            
            return null;
        }
        
        private function hashPassword($password) : string
        {
            $salt = '$2y$11$'. bin2hex(random_bytes(64));
            return crypt($password, $salt);
        }
        
    }
?>
<?php

    class SQLModel
    {
        public function getDatabase()
        {
            $dsn = 'mysql:host=localhost;dbname=u225078163_burgerfuel;charset=utf8mb4;';
            $user = 'u225078163_baptiste';
            $pass = 'Thewitcher77123';
            $options = [
                    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC // fetchAll -> retourne des tableau associatifs
            ];
                        
            $pdo = new PDO($dsn, $user, $pass,$options);
            return $pdo;
        }
    }



?>
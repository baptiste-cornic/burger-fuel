<?php

    class ProductModel
    {
        
        public function getAllProducts()
        {
            $model = new SQLModel();
            $pdo = $model->getDatabase();
            
            $query = $pdo->query('SELECT * FROM products ');
            $products = $query->fetchAll(PDO::FETCH_ASSOC);
            return $products;
        }
        
             
    
        public function getProductsName()
        {
            $model = new SQLModel();
            $pdo = $model->getDatabase();
            
            $query = $pdo->query('SELECT name, id FROM products ');
            
            $product = $query->fetchAll(PDO::FETCH_ASSOC);
            return $product;
        }
        
        
        public function getOneProduct($id)
        {
            $model = new SQLModel();
            $pdo = $model->getDatabase();
            
            $sql ='SELECT *
                    FROM products
                    WHERE id = ?
                    ';
            $query = $pdo->prepare($sql);
            $query->execute([ $id ]);        
            $product = $query->fetch();
            return $product;
        }
        
        public function getFirstProduct()
        {
            $model = new SQLModel();
            $pdo = $model->getDatabase();
            $query = $pdo->query('SELECT * FROM products LIMIT 1');
            $product = $query->fetch();
            return $product;
            
        }
        
        public function insert($name, $description, $price, $image)
        {
            $model = new SQLModel();
            $pdo = $model->getDatabase();
            
            $sql = ('INSERT INTO 
                products( id,name, description, price, image ) 
                VALUES (NULL, ?, ?, ?, ?)'
                );
            
            $query = $pdo->prepare($sql);
            $query->execute([$name, $description, $price, $image ]);
        }
        
    }


?>
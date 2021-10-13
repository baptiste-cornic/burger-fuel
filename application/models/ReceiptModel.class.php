<?php

    class ReceiptModel
    {
        public function insert($userId, $total)
        {
            $model = new SQLModel();
            $pdo = $model->getDatabase();
            
            $sql = ('INSERT INTO 
                orders( id,user_id, order_date, total ) 
                VALUES (NULL, ?, NOW(), ?)');
            
            $query = $pdo->prepare($sql);
            $query->execute([$userId, $total ]);
                
                
            $query = $pdo->query('SELECT MAX(id) as id FROM orders');
            $id = $query->fetch()['id'];
            
            $sql = ('INSERT INTO 
                    product_order(order_id, product_id, quantity )
                    VALUES ( ?, ?, ? )');
            $query = $pdo->prepare($sql);
            
            for($i = 0; $i < count($_SESSION['order']); $i++)
            {
                $query->execute([ $id, $_SESSION['order'][$i]['productId'], $_SESSION['order'][$i]['quantity'] ]);
            }
   
            unset($_SESSION['order']);
            unset($_SESSION['total']);
        }
    }
    
?>
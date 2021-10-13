'use strict';

class Basket
{
    constructor()
    {
        this.products = [];
    }
      
      
    add(productId,productName, quantity, price) 
    {   
        let product = { 
            productId : productId,
            productName : productName,
            quantity :quantity,
            price : price
        };
        
        let inside = false;
        //console.log(product.productId);
        
        for(let i = 0 ; i < this.products.length; i++)
        {
            if(product.productId == this.products[i].productId)
            {
                this.products[i].quantity +=  product.quantity; 
                inside = true;
            }
        }
        
        if(inside == false)
        {
            this.products.push(product);
        }
        this.save();

    }
    
    display()
    {
        $('.basket-order').html("");
        let result = 0;
        for(let i = 0 ; i < this.products.length; i++)
        {
            if(this.products[i].quantity != "")
            {
                result +=  this.products[i].quantity * this.products[i].price;
    
            //  il faudrait afficher l'image du burger comme sur le vrai site
    
                $('.basket-order').append(`<div class="order-burger">
                <div> <p>${this.products[i].quantity}</p> </div>
                <div class="product-name"><p>${this.products[i].productName}</p></div>
                <div><p>${this.products[i].price} €</p></div>
                <div><p>${this.products[i].quantity * this.products[i].price} €</p></div>
                <div> <button class="delete-order" data-index="${this.products[i].productId}">X</button></div>
                </div>`);
                //console.log(this.products[i]);
            }
        }
        //console.log(this.products);
        if(this.products.length > 0)
        {
             $('.basket-order').append(`<div class="price-total">
            <p>Total</p>
            <p>${result} €</p>
            </div>
            <div class="validate-order">
            <button class="btn-validate">Validate</button>
            </div>`)
        }
    };
    
    remove(data)
    {
        for(let i = 0 ; i < this.products.length; i++)
        {
            if(this.products[i].productId == data)
            {
                //console.log(this.products[i]);
                this.products.splice(i, 1);
                this.save();
                return
            }
        }
    }
    
    save()
    {
        window.localStorage.setItem('basket' , JSON.stringify(this.products));
    }
    
    load()
    {
        let json = window.localStorage.getItem('basket');
        if( json != null )
        {
            this.products = JSON.parse(json);
        }
    }
    
}


document.addEventListener('DOMContentLoaded', function (){
    openPage();
    let basket = new Basket;
    
    basket.load();
    basket.display();
     
    let btn = document.querySelector('.order-btn');
    btn.addEventListener('click', function()
        {
            let id = select.value;
            
            let productName = $( "#product-name option:selected" ).text();
            let quantity = Number(document.querySelector('.quantity input').value);
            let price = $('.price').text().replace("€", "");
            
            //console.log(price);
            
            basket.add(id, productName, quantity, price);
            basket.display();
        });
    
    let select = document.querySelector('select');
    select.addEventListener('change', change_display);
    
    
    $('.basket-order').on('click',`.delete-order`, function()
    {   
        let data = $(this).data('index');
        
        basket.remove(data);
        basket.display();
    })
    
    $('.basket').on('click', '')
    $('.basket').on('click','.btn-validate', function()
    {
        let url = getRequestUrl() + '/session';
 
        let send = JSON.stringify(basket.products);
        let json= { 'order' : send };
 
        $.post(url, json,  validateBasket);
       // console.log(basket.products[0]);
        
    })
    

    
//           -------------------------------------------------------------------------------------
   
    function change_display()
    {
        let id = select.value;
        let send = { 'id' : id };
        let url = getRequestUrl() + '/product';
       
        $.get(url, send, getTheProduct );
    }
    
    function getTheProduct(json) 
    {
        let product = JSON.parse(json);
        
        $('.img').html(`<img src="">`);
        $('.img img').attr('src' , getWwwUrl()+'/images/meals/'+product.image);
        
        $('.description').html(`${product.description}`);
        $('.price').html(`${product.price} €`);
        $('.quantity').html(`<label>Quantity</label>`);
        
        $('.quantity').append(`<input type="text">`);
        $('.order-btn').css("display", "block");
    }

    function openPage()
    {
        let url = getRequestUrl() + '/openOrder';
        
        $.get(url, getFirstProduct );
        //console.log(url);
    }
        
     function getFirstProduct(json2)
    {
        let product = JSON.parse(json2);
        //console.log(product);
        $('.img').html(`<img src="">`);
        $('.img img').attr('src' , getWwwUrl()+'/images/meals/'+product.image);
        
        $('.description').html(`${product.description}`);
        $('.price').html(`${product.price} €`);
        $('.quantity').html(`<label>Quantity</label>`);
        
        $('.quantity').append(`<input type="text">`);
        $('.order-btn').css("display", "block");
    }
    
    function validateBasket( response )
    {
        if(response == true )
        {
            window.location.href = getRequestUrl() + '/confirm';
        }
    }
    
})
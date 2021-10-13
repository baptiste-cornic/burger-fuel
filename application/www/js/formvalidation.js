'use strict';

    
    let firstname = document.getElementById('firstname');
    let lastname = document.getElementById('lastname');
    let address = document.getElementById('address');
    let city = document.getElementById('city');
    let country = document.getElementById('country');
    let post_code = document.getElementById('post_code');
    let phone = document.getElementById('phone');
    let email = document.getElementById('email');
    let password = document.getElementById('password');
    let form = document.querySelector('form');
    
    document.addEventListener('DOMContentLoaded', function (){
    // ca passe
    form.addEventListener('submit', check);

    function check(event){
        // affiche un pop-up dicret au niveau de l'input avec le texte que je choisi et entoure l'input en rouge
        /* 
         if( firstname.value == "" ){
             firstname.setCustomValidity("I am expecting a firstname !");
             console.log('wrong'); 
         }
         */
        
        if(firstname.value == '')
        {
            event.preventDefault();
            firstname.placeholder = "firstname to complete"; 
        }
        
         if(lastname.value == '')
        {
            event.preventDefault();
            lastname.placeholder = "lastname to complete"; 
        }
        
        if(address.value == '')
        {
            event.preventDefault();
            address.placeholder = "address to complete"; 
        }
        
        if(city.value == '')
        {
            event.preventDefault();
            city.placeholder = "city to complete"; 
        }
        
        if(country.value == '')
        {
            event.preventDefault();
            country.placeholder = "country to complete"; 
        }
        
        if(post_code.value == '' || post_code.value.length != 5)
        {
            event.preventDefault();
            post_code.value = ""
            post_code.placeholder = "to complete with 5 character"; 
        }
        
        if(phone.value == '')
        {
            event.preventDefault();
            phone.placeholder = "phone to complete"; 
        }
        
        if(email.value == '')
        {
            event.preventDefault();
            email.placeholder = "email to complete"; 
        }
        
        if(password.value == '' || password.value.length < 8)
        {
            event.preventDefault();
            password.value = ""
            password.placeholder = "a password with 8 letters min"; 
        }
        
    }
});


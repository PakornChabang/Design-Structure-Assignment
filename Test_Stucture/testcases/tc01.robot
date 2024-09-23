*** Settings ***
Resource    ../keywords/pages/import.robot
*** Test Cases ***
Test Register 
    common.Open Website
    common.Click User ICON
    log_in_page.Click Sign up button
    register_page.Input Register Email    ${user01.email}
    register_page.Input Register Password    ${user01.password}
    register_page.Input Confirm Password    ${user01.cf_password}
    register_page.Submit Registration
    common.Click User ICON
    user_profile_page.Log Out
Test Log in
    common.Open Website
    common.Click User ICON
    log_in_feature.Login    ${user01.email}    ${user01.password}
    home_page.Type and Search Product    ${user01.product}
    home_feature.Add Product to Cart    ${product.product_name}
    common.Open Cart
    cart_feature.Fill in Delivery info and Start Payment Process    ${user01.name}    ${user01.surname}    
    ...    ${user01.address}    ${user01.phone}    ${user01.email} 
    payment_page.Select Payment Method 
    payment_feature.Fill in Credit Card Details and Confirm Payment    ${user01.creditcard}    ${user01.exp}    
    ...    ${user01.cvc}    ${user01.name}    
    common.Click User ICON
    user_profile_page.Log Out
    #รัน uat sit robot  -d result -v type:uat tc01.robot

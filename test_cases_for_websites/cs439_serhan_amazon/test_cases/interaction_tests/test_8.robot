*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank  chrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr
${input_mail}        xpath://*[@id="ap_email"]
${input_passw}       xpath://*[@id="ap_password"]

${mail}     yourmail
${passw}    yourpassword


${btn_add}      xpath://*[@id="add-to-cart-button"]
${btn_item}     xpath://*[@id="zg_left_col1"]/div[1]/div[2]/div/div[2]/a
${btn_cont}     xpath://*[@id="continue"]  
${btn_login}    xpath://*[@id="signInSubmit"]
${btn_cart}     xpath://*[@id="nav-cart-text-container"]
${btn_finish}     xpath://*[@id="sc-buy-box-ptc-button"]/span/input
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 1s

*** Test Cases ***
Buy Item and Login
    [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie}   
    Page Should Contain   Teslimat adres 
    Click Link   link:Çok Satanlar    
    ${url}=   Get Location
    Should Contain    ${url}    bestsellers  
    Click Button    ${btn_item}
    Execute JavaScript    window.scrollTo(0, 300)
    Sleep    1
    Click Button    ${btn_add}
    Click Button    ${btn_cart}
    Click Button    ${btn_finish}
    Input Box   ${input_mail}    ${mail}  
    Click Button    ${btn_cont} 
    Input Box    ${input_passw}    ${passw}   
    Click Button    ${btn_login}


*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


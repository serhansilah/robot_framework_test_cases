*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr
${input_mail}        xpath://*[@id="ap_email"]
${input_passw}       xpath://*[@id="ap_password"]


${mail}     yourmail
${passw}    yourpassword
${user}    yourname

${btn_cont}     xpath://*[@id="continue"]  
${btn_login}    xpath://*[@id="signInSubmit"]
${btn_teslim}    xpath://*[@id="GLUXSignInButton"]/span/input
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 1s

*** Test Cases ***      
Order Adress
    [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie}    
    Page Should Contain   Teslimat adres 
    Click Link   partial link:Teslimat adres 
    Sleep  1  
    Click Button    ${btn_teslim}
    Input Box   ${input_mail}    ${mail}  
    Click Button    ${btn_cont} 
    Input Box    ${input_passw}    ${passw}   
    Click Button    ${btn_login}
    Page Should Contain   ${user} 


*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


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
${input_repassw}       xpath://*[@id="ap_password_check"]   
${input_name}    xpath://*[@id="ap_customer_name"]

${mail}     deneme-den@hotmail.com
${passw}    Amazon1998
${name}     Deneme Den
${register_btn}   xpath://*[@id="continue"]
${cookie}    xpath://*[@id="sp-cc-accept"]
*** Test Cases ***
Register   
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie}    
    Click Link   partial link:Hesap
    Click Link   partial link:oluşturun
    Input Box   ${input_name}    ${name}  
    Input Box    ${input_mail}    ${mail}   
    Input Box    ${input_passw}    ${passw}  
    Input Box    ${input_repassw}    ${passw}   
    Click Element   ${register_btn}
     
    

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


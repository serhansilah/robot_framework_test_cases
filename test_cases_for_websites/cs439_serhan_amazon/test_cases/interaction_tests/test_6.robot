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


${btn_cnt}    xpath://*[@id="continue"]
${btn_login}    xpath://*[@id="signInSubmit"]


${mail}     yourmail
${passw}    yourpassword
${name}     yourname
${register_btn}   xpath://*[@id="continue"]
${cookie}    xpath://*[@id="sp-cc-accept"]
${signin}    xpath://*[@id="nav-flyout-ya-signin"]/a/span

#sleep 3s

*** Test Cases ***
Log in and log out   
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button  ${cookie}    
    Mouse Over     partial link:Hesap
    Click Button    ${signin}   
    Input Box    ${input_mail}    ${mail} 
    Click Element  ${btn_cnt}
    Input Box    ${input_passw}    ${passw} 
    Click Element  ${btn_login}
    Sleep  1
    Page Should Contain    ${name}
    ${url}=   Get Location
    Should Contain    ${url}     signin
    Mouse Over   partial link:Hesap
    Sleep     2
    Click Link  link:Çıkış Yap
    

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


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
${full_name}    Ali Tunceli
${text_box}    xpath://*[@id="ap_customer_name"]
${mail}     yourmail
${passw}    yourpassword
${name}     yourname
${security_btn}   xpath://*[@id="a-page"]/div[2]/div/div[2]/div[2]/a/div/div
${update_btn}    xpath://*[@id="auth-cnep-edit-name-button"]
${save_btn}    xpath://*[@id="cnep_1C_submit_button"]
${cookie}    xpath://*[@id="sp-cc-accept"]
${signin}    xpath://*[@id="nav-flyout-ya-signin"]/a/span

*** Test Cases ***
Account Information Control and some changes
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie}   
    Mouse Over     partial link:Hesap
    Click Button    ${signin}   
    Input Box    ${input_mail}    ${mail} 
    Click Element  ${btn_cnt}
    Input Box    ${input_passw}    ${passw} 
    Click Element  ${btn_login}
    Page Should Contain    ${name}
    Click Link   partial link:Hesap 
    Click Element  ${security_btn}
    Click Element  ${update_btn}
    Clear Element Text   ${text_box} 
    Input Box    ${text_box}     ${full_name}
    Click Element  ${save_btn}

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr
${input_mail}        xpath://*[@id="ap_email"]
${input_passw}       xpath://*[@id="ap_password"]
${input_gc}       xpath://*[@id="gc-redemption-input"]
${mail}     yourmail
${passw}    yourpassword
${btn_cnt}    xpath://*[@id="continue"]
${btn_login}    xpath://*[@id="signInSubmit"]
${category}    xpath://*[@id="searchDropdownBox"]
${btn_search}    xpath://*[@id="nav-search-submit-button"]
${btn_gift_add}     xpath://*[@id="a-autoid-1-announce"]
${add_account}     xpath://*[@id="gc-redemption-apply-button"]
${cookie}    xpath://*[@id="sp-cc-accept"]
${signin}    xpath://*[@id="nav-flyout-ya-signin"]/a/span
#sleep 2s
*** Test Cases ***
Gift card
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
    Sleep  1
    Click Element  ${category}
    Sleep  1
    Select From List By Label    ${category}    Hediye Kartları
    Click Button    ${btn_search} 
    Click Button    ${btn_gift_add}
    Input Box    ${input_gc}     250
    Click Button    ${add_account} 
    


*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


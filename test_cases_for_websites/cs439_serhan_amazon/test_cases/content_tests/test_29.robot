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


${btn_buy}      xpath://*[@id="buy-now-button"]
${btn_item}     xpath://*[@id="zg_left_col1"]/div[1]/div[2]/div/div[2]/a
${btn_cont}     xpath://*[@id="continue"]  
${btn_login}    xpath://*[@id="signInSubmit"]
${check}     xpath://*[@id="s-refinements"]/div[1]/ul/li[2]/span/span
${cookie}    xpath://*[@id="sp-cc-accept"]

# 2 SN SLEEP
*** Test Cases ***
 Select the NavBar All
    [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie}    
    Click Link   link:Tümü 
    Sleep  1  
    Click Button   link:Bahçe
    Sleep    1
    Click Link    partial link:Tohumlar
    ${check}=    Get Text     ${check} 
    Should Be Equal    ${check}    Bitkiler, Tohumlar ve Soğanlar


*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


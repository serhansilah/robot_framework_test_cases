*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    chrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr
${input_mail}        xpath://*[@id="ap_email"]
${input_passw}       xpath://*[@id="ap_password"]

${mail}     yourmail
${passw}    yourpassword

${btn_comment}      xpath://a[@data-hook="write-review-button"]
${btn_item}     xpath://*[@id="zg_left_col1"]/div[1]/div[2]/div/div[2]/a
${btn_login}    xpath://*[@id="signInSubmit"]
${cookie}    xpath://*[@id="sp-cc-accept"]

*** Test Cases ***
Comment 
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie} 
    Page Should Contain   Teslimat adres 
    Click Link   link:Çok Satanlar  
    ${url}=   Get Location
    Should Contain    ${url}    bestsellers  
    Click Button    ${btn_item}
    Scroll Element Into View     //*[@id="reviewsMedley"]/div/div[1]/div[1]/h2
    Wait Until Element is visible    ${btn_comment}    timeout=5s
    Set Focus To Element    ${btn_comment}       
    Click Button    ${btn_comment}
    Input Box   ${input_mail}    ${mail}
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


*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr
${cookie}      xpath://*[@id="sp-cc-accept"]
${elday}   xpath://img[@title="Elday"]
${main_page}   xpath://*[@id="nav-logo-sprites"]
${search}      xpath://*[@id="rhf-container"]/div/div[3]

${input_mail}        xpath://*[@id="ap_email"]
${input_passw}       xpath://*[@id="ap_password"]
${mail}     yourmail
${passw}    yourpassword
${btn_cnt}    xpath://*[@id="continue"]
${btn_login}    xpath://*[@id="signInSubmit"]
${btn_item}     xpath://*[@id="zg_left_col1"]/div[1]/div[2]/div/div[2]/a
${cookie}    xpath://*[@id="sp-cc-accept"]
${signin}    xpath://*[@id="nav-flyout-ya-signin"]/a/span

#sleep 4s
*** Test Cases ***
History
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie} 
    Mouse Over    partial link:Hesap 
    Click Button    ${signin}
    Input Box    ${input_mail}    ${mail} 
    Click Element  ${btn_cnt}
    Input Box    ${input_passw}    ${passw} 
    Click Element  ${btn_login}
    Sleep  1
    Click Link   partial link:Çok Satanlar
    ${url}=   Get Location
    Should Contain    ${url}    bestsellers
    Click Button    ${btn_item}
    Click Button    ${main_page}
    Execute JavaScript    window.scrollTo(0, 4500)
    Sleep  3
    Click Link    partial link:Görüntüleme geçmişini gör
 
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections
Library    XML
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_sucourse}        https://vk.com
${phone_path}    xpath://*[@id="index_email"]
${passw_path}    xpath://*[@id="index_pass"]
${sign_in}    xpath://*[@id="index_login_button"]
${phone}    phone
${password}    password
${audio_search}     xpath://*[@id="audio_search"]
${audio}    Опера #2
*** Test Cases ***
Music search
   [tags]    success
    Maximize Browser Window
    Go To     ${url_sucourse}
    Input Box    ${phone_path}    ${phone} 
    Input Box    ${passw_path}    ${password} 
    Click Button    ${sign_in}
    Sleep  4
    Click Link    partial link:Müzik
    Sleep  3
    Input Box    ${audio_search}    ${audio}
    Sleep  2
    Page Should Contain    ${audio} 
    Page Should Contain    2001 
   

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


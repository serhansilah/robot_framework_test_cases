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
*** Test Cases ***
Navigate Profile
   [tags]    success
    Maximize Browser Window
    Go To     ${url_sucourse}
    Input Box    ${phone_path}    ${phone} 
    Input Box    ${passw_path}    ${password} 
    Click Button    ${sign_in}
    Sleep  3
    Click Link    partial link:Profilim
    Sleep  3
    Page Should Contain    Ali Tunceli
    Page Should Contain    İstanbul
    ${url}=     Get Location
    Should Contain    ${url}    id
 
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


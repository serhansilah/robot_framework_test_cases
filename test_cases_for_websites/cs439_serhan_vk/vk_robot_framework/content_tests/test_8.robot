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
${edit}    xpath://*[@id="profile_edit_act"]
${check_edit}    xpath://*[@id="pedit_first_name"]
*** Test Cases ***
Content edit
   [tags]    success
    Maximize Browser Window
    Go To     ${url_sucourse}
    Input Box    ${phone_path}    ${phone} 
    Input Box    ${passw_path}    ${password} 
    Click Button    ${sign_in}
    Sleep  4
    Click Link    partial link:Profilim
    Sleep  3
    Page Should Contain    Ali Tunceli
    Page Should Contain    İstanbul
    ${url}=     Get Location
    Should Contain    ${url}    id
    Click Button    ${edit}
    Sleep  2
    ${check}=  Get Element Attribute  ${check_edit}  value    
    Should Be Equal      ${check}    Ali

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


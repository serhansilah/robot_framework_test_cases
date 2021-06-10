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
${search_group}     xpath://*[@id="ui_rmenu_search"]/span
${group_input}    xpath://*[@id="search_query"]
${search}    xpath://*[@id="group_u_search_input_wrap"]/div/div[1]/button
${go_page}    xpath://*[@id="results"]/div[1]/div[3]/div[1]/a

*** Test Cases ***
Find group
   [tags]    success
    Maximize Browser Window
    Go To     ${url_sucourse}
    Input Box    ${phone_path}    ${phone} 
    Input Box    ${passw_path}    ${password} 
    Click Button    ${sign_in}
    Sleep  4
    Click Link    partial link:Topluluk
    Sleep  1
    Click Button    ${search_group}
    Sleep  1 
    Input Box    ${group_input}    zenit
    Sleep  2
    Click Button    ${search}
    Sleep  1
    Click Button    ${go_page}
    Sleep    3
    ${url}=  Get Location
    Should Contain    ${url}    zenit
    



*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


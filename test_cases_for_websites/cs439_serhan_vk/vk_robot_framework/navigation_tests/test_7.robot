*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections
Library    XML
Suite Setup        Open Browser    about:blank    chrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_sucourse}        https://vk.com
${phone_path}    xpath://*[@id="index_email"]
${passw_path}    xpath://*[@id="index_pass"]
${sign_in}    xpath://*[@id="index_login_button"]

${phone}    phone
${password}    password
${edit}    xpath://*[@id="profile_edit_act"]
${vk_connect}     xpath://*[@id="profile_editor_vkconnect_notice"]/div/footer/a[1]
${change_name}     xpath://*[@id="personal"]/div/section/div[1]/form/div/div[1]/div[1]/div/input
${save}     xpath://*[@id="personal"]/div/section/div[1]/form/div/div[3]/button/div/div
*** Test Cases ***
Navigate Connect
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
    Click Button    ${vk_connect}
    Sleep  5
    Switch Window    NEW
    Sleep  1
    ${url}=     Get Location
    Should Contain    ${url}    personal

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


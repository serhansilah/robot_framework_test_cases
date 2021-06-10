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
${top_profile}     xpath://*[@id="top_profile_link"]
${files}     xpath://*[@id="settings_menu_0"]/a[15]/div/span[3]
${save}     xpath://*[@id="box_layer"]/div[2]/div/div[3]/div[1]/table/tbody/tr/td[2]/button
*** Test Cases ***
Log Out
   [tags]    success
    Maximize Browser Window
    Go To     ${url_sucourse}
    Input Box    ${phone_path}    ${phone} 
    Input Box    ${passw_path}    ${password} 
    Click Button    ${sign_in}
    Sleep  4
    Click Button    ${top_profile} 
    Sleep  1
    Click Link    partial link:Çıkış yap
   



*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


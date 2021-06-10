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
${search}     xpath://*[@id="ts_input"]
${person}     xpath://*[@id="ts_contact654434059"]
${searched}    Ege Tasdemir
${share}     xpath://*[@id="post654434059_3"]/div/div[2]/div/div[2]/div/div[1]/a[3]/div[1]
${share_btn}     xpath://*[@id="like_share_send"]
*** Test Cases ***
Share
   [tags]    success
    Maximize Browser Window
    Go To     ${url_sucourse}
    Input Box    ${phone_path}    ${phone} 
    Input Box    ${passw_path}    ${password} 
    Click Button    ${sign_in}
    Sleep  4
    Input Box    ${search}    ${searched}
    Sleep    1
    Click Button    ${person}
    Sleep    1
    Page Should Contain    ${searched}
    Click Button  ${share} 
    Sleep  1
    
    Click Element    css= #like_share_my
    Click Button    ${share_btn}
    Sleep  1
    Page Should Contain    Kayıt gönderildi
    Sleep  1
    Click Link    partial link:Profilim
    Sleep  1
    Page Should Contain    Ege Tasdemir

 
  
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


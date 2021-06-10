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
${person}     xpath://*[@id="ts_contact654155741"]/span[2]/div[1]
${searched}    Tosun Patlican
${comment}     xpath://*[@id="post654155741_24"]/div/div[2]/div/div[2]/div/div[1]/a[2]/div[1]
${comment_path}     xpath://*[@id="reply_field654155741_24"]
${msg}    Merhaba
${reply}   xpath://*[@id="reply_button654155741_24"]
${vk_icon}     xpath://*[@id="top_nav"]/li[1]/a

*** Test Cases ***
Comment
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
    Click Button  ${comment} 
    Input Box    ${comment_path}     ${msg}
    Click Button    ${reply}
    Click Button    ${vk_icon}
    Sleep  2
    Click Link    partial link:Yorumlar
    Sleep  1
    Page Should Contain    Tosun Patlican
    Page Should Contain    ${msg}

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


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
${search}     xpath://input[@placeholder="Soruyu giriniz"]
${msg}    hide
${option}     xpath://div[text()="How do I hide my profile from other users?"]
${fixed}     xpath://*[@id="tickets_faq_links18591"]/span[1]
*** Test Cases ***
Fixed issue
   [tags]    success
    Maximize Browser Window
    Go To     ${url_sucourse}
    Input Box    ${phone_path}    ${phone} 
    Input Box    ${passw_path}    ${password} 
    Click Button    ${sign_in}
    Sleep  4
    Click Button    ${top_profile} 
    Sleep  1
    Click Link    Yardım
    Sleep  2
    ${url}=  Get Location 
    Should Contain    ${url}    support
    Input Box   ${search}    ${msg}
    Sleep    1
    Click Link    partial link:How do I hide my profile from other users?
    Sleep    1
    Page Should Contain   How do I hide my profile from other users?
    Execute Javascript     window.scrollTo(0, 300)
    Click Button    ${fixed}
    Sleep    1
    Page Should Contain    Size yardımcı olduğumuza sevindik
    

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


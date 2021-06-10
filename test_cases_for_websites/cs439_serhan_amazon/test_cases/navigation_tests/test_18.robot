*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr/
${input_mail}        xpath://*[@id="ap_email"]
${input_passw}       xpath://*[@id="ap_password"]
${mail}     yourmail
${passw}    yourpassword
${btn_login}    xpath://*[@id="signInSubmit"]
${prime_loc}      xpath://*[contains(., "30 gün")]
${free_trial}    xpath://*[@id="prime-footer-cta"]/span/input
${reach_us}      xpath://*[@id="a-autoid-0-announce"]
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 2s

*** Test Cases ***
Go to the Communication Page
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie} 
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep  1
    Click Link        partial link:İletişim
    ${url}=   Get Location
    Should Contain    ${url}    help/customer
    Sleep  1
    Execute JavaScript    window.scrollTo(0, 500)
    Click Button    ${reach_us}  
    Input Box   ${input_mail}    ${mail}
    Input Box    ${input_passw}    ${passw}  
    Click Button    ${btn_login}
    ${contact_url}=   Get Location
    Should Contain    ${contact_url}    contact
    
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}
  




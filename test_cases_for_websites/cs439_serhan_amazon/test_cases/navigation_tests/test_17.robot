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
${30_btn_loc}      xpath://*[contains(., "göre")]
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 3s
*** Test Cases ***
Go to the Benefits Page
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep  1
    Click Link        partial link:Kariyer
    ${url}=   Get Location
    Should Contain    ${url}    amazon.jobs
    Sleep  1
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Link        partial link:Benefits
    Sleep    1     
    ${benefit_url}=   Get Location
    Should Contain    ${benefit_url}    benefits
  
    
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}





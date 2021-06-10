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
${30_btn_loc}      xpath://*[contains(., "Özel fırsatları")]
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 1s

*** Test Cases ***
Go to the GoldBox and Come Back
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button   ${cookie} 
    Scroll Element Into View    ${prime_loc}
    Wait Until Element is visible    partial link:30 gün    timeout=5s
    Set Focus To Element    partial link:30 gün      
    Click Link        partial link:30 gün
    ${url}=   Get Location
    Should Contain    ${url}    prime
    Execute JavaScript    window.scrollTo(0, 500)
    Sleep  1
    Scroll Element Into View    ${30_btn_loc}
    Wait Until Element is visible    partial link:Fırsatları yakala    timeout=5s
    Set Focus To Element    partial link:Fırsatları yakala      
    Click Link        partial link:Fırsatları yakala
    ${fırsat_url}=   Get Location
    Should Contain    ${fırsat_url}    goldbox
    
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}





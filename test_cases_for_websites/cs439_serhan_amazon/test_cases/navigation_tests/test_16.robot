*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    chrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr/
${input_mail}        xpath://*[@id="ap_email"]
${input_passw}       xpath://*[@id="ap_password"]
${mail}     yourmail
${passw}    yourpassword
${btn_login}    xpath://*[@id="signInSubmit"]
${prime_loc}      xpath://*[contains(., "Prime Video'yu")]
${free_trial}      xpath://*[@id="dvm_MLP_tr_Join_1"]/div/div[2]/div[2]/a[2]/span[2]
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 1s

*** Test Cases ***
Go to the Prime Video Page
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie}
    Scroll Element Into View    ${prime_loc}
    Wait Until Element is visible    partial link:Prime Video'yu    timeout=5s
    Set Focus To Element    partial link:Prime Video'yu      
    Click Link        partial link:Prime Video'yu
    Switch Window    NEW 
    ${url}=   Get Location
    Should Contain    ${url}    primevideo   
    Sleep  1
    Click Link    partial link:30 günlük 
    Input Box   ${input_mail}    ${mail}
    Input Box    ${input_passw}    ${passw}  
    Click Button    ${btn_login}
 
    
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}





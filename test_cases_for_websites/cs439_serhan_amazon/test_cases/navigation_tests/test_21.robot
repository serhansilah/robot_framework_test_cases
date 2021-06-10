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

${free_trial}    xpath://*[@id="prime-footer-cta"]/span/input
${reach_us}      xpath://*[@id="a-autoid-0-announce"]
${ios_btn}   xpath://*[@id="a-page"]/div[2]/div/div/div/div/div/div/div/div[1]/div[2]/div[2]/div[3]/div[2]/a
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 2s

*** Test Cases ***
Go to the App Store
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep  1
    Click Link        partial link:Amazon Mobil Uygulaması
    ${url}=   Get Location
    Should Contain    ${url}    mobapp
    Sleep  1
    Execute JavaScript    window.scrollTo(0, 500)
    Click Element    ${ios_btn}
    Switch Window    NEW 
    ${appstore_url}=   Get Location
    Should Contain    ${appstore_url}    apps.apple
    
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}
  




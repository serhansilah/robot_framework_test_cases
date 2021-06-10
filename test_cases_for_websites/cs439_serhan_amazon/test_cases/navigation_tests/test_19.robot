*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    chrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr/
${cookie}      xpath://*[@id="cookie-consent-accept"]/div/a
${first_cookie}      xpath://*[@id="sp-cc-accept"]
*** Test Cases ***
Go to the Youtube Page
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${first_cookie} 
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep  1
    Click Link        partial link:Amazon'da Satış Yapın
    ${url}=   Get Location
    Should Contain    ${url}    services.amazon
    Sleep  1
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Button    ${cookie}
    Click Link    partial link:kanalımıza erişmek 
    Switch Window    NEW 
    Sleep  1
    ${youtube_url}=   Get Location
    Should Contain    ${youtube_url}    youtube.com/channel
    
*** Keywords ***
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}
  




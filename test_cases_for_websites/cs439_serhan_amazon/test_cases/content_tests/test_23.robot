*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr
${cookie}      xpath://*[@id="sp-cc-accept"]
${elday}   xpath://img[@title="Elday"]
*** Test Cases ***
Elday Page
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie} 
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Link        partial link:Geri Dönüşüm
    Page Should Contain   Elektrikli ve Elektronik Ekipman
    Page Should Contain    Piller
    Page Should Contain    Ambalajlar
    Page Should Contain    Ampuller
    Scroll Element Into View    ${elday}
    Wait Until Element is visible   ${elday}   timeout=5s
    Set Focus To Element    ${elday}     
    Click Button    ${elday}
    ${url}=   Get Location
    Should Contain    ${url}    elday.org
 
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


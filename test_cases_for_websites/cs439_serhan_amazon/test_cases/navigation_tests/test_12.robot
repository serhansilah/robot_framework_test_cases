*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr

${prime_loc}      xpath://*[contains(., "30 gün")]
${cookie}    xpath://*[@id="sp-cc-accept"]

*** Test Cases ***
Homepage can go to Prime
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie} 
    Scroll Element Into View    ${prime_loc}
    Wait Until Element is visible    partial link:30 gün    timeout=5s
    Set Focus To Element    partial link:30 gün      
    Click Link        partial link:30 gün
    ${url}=   Get Location
    Should Contain    ${url}    prime




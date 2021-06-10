*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr
${prime_loc}      xpath://*[contains(., "30 gün")]
${btn_game}    xpath://*[@id="prime-benefit-cards"]/div[4]/div[1]
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 2s

*** Test Cases ***
Homepage can go to Prime Gaming
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
    Execute JavaScript    window.scrollTo(0, 400)
    Sleep  1
    Click Element    ${btn_game}
    Sleep    1
    Execute JavaScript    window.scrollTo(0, 800)
    Click Link    partial link:Prime Gaming'i keşfet
    ${game_url}=   Get Location
    Should Contain    ${game_url}    primegaming


*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


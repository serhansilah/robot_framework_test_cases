*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    chrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr/
${price_loc}      xpath://*[contains(., "500 TL Üzeri")]
${nav_loc}      xpath://*[contains(., "Önceki")]
${page_2}    xpath://*[@id="search"]/div[1]/div/div[1]/div/span[3]/div[2]/div[25]/span/div/div/ul/li[3]/a
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 1s

*** Test Cases ***
Go to the PC and Navigate Pages
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button     ${cookie}    
    Click Link        partial link:Bilgisayar
    ${url}=   Get Location
    Should Contain    ${url}    bilgisayar
    Sleep  1
    Scroll Element Into View    ${price_loc}
    Wait Until Element is visible   link:500 TL Üzeri   timeout=5s
    Set Focus To Element    link:500 TL Üzeri     
    Click Link      link:500 TL Üzeri
    Scroll Element Into View    ${nav_loc}
    Wait Until Element is visible   ${page_2}   timeout=5s
    Set Focus To Element    ${page_2}     
    Click Link      ${page_2}
    ${page_url}=   Get Location
    Should Contain    ${page_url}      page=2
  
*** Keywords ***
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}
  




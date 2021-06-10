*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr
${postal_code}     34912
${input_postal_code}      xpath://*[@id="free_same_day_zip_checker_input"]
${btn_ship}   xpath://img[@alt="Bedava ve Hızlı kargo"]
${control}  xpath://*[@id="free_same_day_zip_checker_button"]/span/input
${cookie}    xpath://*[@id="sp-cc-accept"]
*** Test Cases ***
Controlling the Postal Code
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie}
    Execute JavaScript    window.scrollTo(0,1200)
    Click Button        ${btn_ship} 
    Execute JavaScript    window.scrollTo(0,800)
    Input Box    ${input_postal_code}  ${postal_code} 
    Click Button    ${control}
    Page Should Contain    Üzgünüz,
    Page Should Contain    34912 Prime Aynı Gün Teslimat bölgesinde değil.

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


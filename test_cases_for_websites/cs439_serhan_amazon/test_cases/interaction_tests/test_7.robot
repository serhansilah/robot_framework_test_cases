*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr
${input_search}       xpath://*[@id="twotabsearchtextbox"]  
${min}   xpath://*[@id="low-price"]

${name}     xpath://*[@id="twotabsearchtextbox"]
${search}     dell bilgisayar
${price}     5000
${search_btn}   xpath://*[@id="nav-search-submit-button"]
${go_btn}        xpath://*[@class="a-button-input"]
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 3s

*** Test Cases ***
Search item and mininmum   
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button   ${cookie}
    Input Box    ${input_search}    ${search} 
    Click Element  ${search_btn}
    Sleep   1   
    Execute JavaScript    window.scrollTo(0, 700)
    Input Box    ${min}    ${price} 
    Sleep    1
    Click Element    ${go_btn} 
    ${elements}=     Get WebElements    xpath://span[@class="a-price-whole"] 
    ${elements}=     Get Slice From List    ${elements}   end=15
    FOR  ${item}  IN  @{elements}
       ${item}=   Get Text     ${item}
       ${item}=  Convert To Number  ${item}
       IF    ${item} < 5.000
       Fail
    END
    END
    ${search_key}=     Get WebElements    ${name}
    ${search_key}=     Get Value        ${search_key}
    Should Be True    '${search_key}'=='${search}'
 


*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}

Check Prices
def 
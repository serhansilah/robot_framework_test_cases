*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections
Suite Setup        Open Browser    about:blank    chrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_sucourse}        https://sucourse.sabanciuniv.edu/plus/
${input_username}        xpath://*[@id="username"]
${input_passw}       xpath://*[@id="password"]
${login_btn}         xpath://a[text()="Login"]
${submit}            xpath://input[@type="submit"]
${dropdown_course}        xpath://*[@id="menucourse"]
${new_event}        xpath://button[@data-action="new-event-button"]
${event_title_path}        xpath://*[@id="id_name"]
${save_btn}        xpath://button[@class="btn btn-primary"]
${mail}     yourmail
${passw}    yourpassword
${event_title}     yourname
${hide}        xpath://*[@data-block="badges"]
*** Test Cases ***
Hide
   [tags]    success
    Maximize Browser Window
    Go To     ${url_sucourse}
    Click Button    ${login_btn} 
    Click Link   partial link:SUNet users 
    Input Box    ${input_username}     ${mail}  
    Input Box    ${input_passw}     ${passw}  
    Click Button    ${submit}
    ${url}=   Get Location
    Should Contain    ${url}    plus/my
    Page Should Contain    You have no badges to display 
    ${elem}=    Get WebElements   //div[@class="block_action"]
    Log To Console    ${elem}
    ${elem}=    Get Slice From List    ${elem}  3  4   
    Click Button      ${elem}
    Sleep    2
    Page Should Contain Element    //div[@class="block_badges block hidden"]




*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


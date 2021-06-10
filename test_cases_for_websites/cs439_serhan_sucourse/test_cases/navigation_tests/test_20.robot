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
${my_course}        xpath://a[@data-toggle="dropdown"]
${activites_path}        xpath://*[@id="inst82425"]

${mail}     yourmail
${passw}    yourpassword
${msg}    xpath://*[@id="nav-message-popover-container"]/div[1]/img
${searchtext}     xpath://*[@id="searchtext"]
${container}     xpath://textarea[@placeholder="Write a message..."]

${container_btn}    xpath://button[@class="btn btn-link"]


*** Test Cases ***
navigate message   
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
    Click Button    ${msg}  
    Click Link    New message
    ${url}=   Get Location
    Should Contain    ${url}    message
   
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


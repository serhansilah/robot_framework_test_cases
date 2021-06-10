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

${mail}     yourmail
${passw}    yourpassword
${name}     yourname


*** Test Cases ***
Go calendar and check courses
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
    Execute JavaScript    window.scrollTo(0, 600)
    Sleep    1
    Click Link    partial link:May 2021
    ${url}=   Get Location
    Should Contain    ${url}    calendar
    ${options}=     Create List    1    2653    2664    2665    2670   3304
    ${courses}=    Get WebElements    ${dropdown_course}    
    FOR  ${item}  IN  @{courses}
       ${item}=   Get Value    ${item}
       Log To Console    ${item}
       List Should Contain Value    ${options}   ${item}
    END
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


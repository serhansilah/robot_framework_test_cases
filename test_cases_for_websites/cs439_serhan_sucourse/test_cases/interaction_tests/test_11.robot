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
${profile_pic}        xpath://*[@id="loggedin-user"]/a/img

${mail}     yourmail
${passw}    yourpassword
${event_title}     yourname
${export}        xpath://*[@class="btn btn-default"]
${geturl}        xpath://*[@id="id_generateurl"]
*** Test Cases ***
Calendar URL
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
    Execute JavaScript    window.scrollTo(0, 800)
    Click Link    partial link:Go to calendar...
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Button    ${export}
    Click Element    css= #id_events_exportevents_all
    Click Element    css= #id_period_timeperiod_weeknext
    Click Button    ${geturl} 
    Execute JavaScript    window.scrollTo(0, 400)
    Page Should Contain    Calendar URL: https://sucourse.sabanciuniv.edu/plus/calendar/export_execute.php?

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


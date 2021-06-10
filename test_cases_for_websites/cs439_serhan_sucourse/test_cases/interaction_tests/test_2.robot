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
${name}     yourname
${additional}    xpath://a[@aria-controls="id_moodle_additional_names"]
${first_name}    xpath://*[@id="id_firstnamephonetic"]
${update_profile_btn}    xpath://*[@id="id_submitbutton"]

*** Test Cases ***
Update profile and input name
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
    Click Button    ${profile_pic}
    ${url}=   Get Location
    Should Contain    ${url}    user/profile
    Execute JavaScript    window.scrollTo(0, 300)
    Click Link   partial link:Edit profile 
    Execute JavaScript    window.scrollTo(300, 700)
    Click Button    ${additional}
    Sleep  2
    Input Box    ${first_name}    Osman Serhan
    Click Button    ${update_profile_btn}
    Sleep  2
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


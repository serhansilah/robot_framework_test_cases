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
${name}     yourname

*** Test Cases ***
Activities
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
    Mouse Over    ${my_course}  
    Sleep    1
    Click Link    partial link:CS439
    Page Should Contain    Activities
    Page Should Contain    Assignments
    Page Should Contain    Forums
    Page Should Contain    Questionnaires
    Page Should Contain    Quizzes
    Page Should Contain    Resources

    
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


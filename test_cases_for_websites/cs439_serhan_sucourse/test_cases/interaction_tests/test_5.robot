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
${arrow}    xpath://div[@class="dndupload-arrow"]
${option}     xpath://*[@class="fp-repo-name"]
${file}     xpath://*[@class="fp-file"]
${selectfile}     xpath://*[@class="fp-select-confirm btn-primary btn"]
*** Test Cases ***
Upload file
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
    Click Link    partial link:Manage private 
    Sleep  3
    Click Button    ${arrow}
    Sleep    3
    Click Button    ${option}
    Sleep    1
    Click Button    ${file} 
    Sleep    1
    Click Button  ${selectfile}

    
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


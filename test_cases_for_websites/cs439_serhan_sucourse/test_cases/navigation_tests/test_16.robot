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
${title_path}        xpath://*[@id="id_subject"]
${body_path}        xpath://*[@id="id_summary_editoreditable"]

${save_changes}      xpath://*[@id="id_submitbutton"]

${title}    The Selenium Test Case
${body}     Selenium is a portable framework for testing web applications. Selenium provides a playback tool for authoring functional tests without the need to learn a test scripting language.
${mail}     yourmail
${passw}    yourpassword
${name}     yourname

*** Test Cases ***
Navigate Blog Entries
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
    Click Link   partial link:Blog entries 
    ${url}=   Get Location
    Should Contain    ${url}    blog
   
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


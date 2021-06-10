*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_sucourse}        https://vk.com
${name_path}    xpath://*[@id="ij_first_name"]
${lastname_path}    xpath://*[@id="ij_last_name"]
${cont}    xpath://*[@id="ij_submit"]

${day}    xpath://*[@id="dropdown1"]
${month}    xpath://*[@id="dropdown2"]
${year}    xpath://*[@id="dropdown3"]
${check}    xpath://*[@id="ij_sex_row"]
${name}    Ali
${latname}    Tunceli
${phone}     1234567897
${phone_loc}    xpath://*[@id="join_phone"]
${next}    xpath://*[@id="join_send_phone"]
*** Test Cases ***
Register
   [tags]    success
    Maximize Browser Window
    Go To     ${url_sucourse}
    Input Box    ${name_path}    ${name} 
    Input Box    ${lastname_path}    ${latname} 
    Click Button    ${day} 
    Sleep    1 
    Mouse Down    xpath=//li[contains(.,'1')]
    Click Button    ${month}  
    Sleep  1
    Mouse Down    xpath=//li[contains(.,'Mart')]
    Click Button    ${year}  
    Sleep  1
    Mouse Down    xpath=//li[contains(.,'2005')]
    Click Element    css= #ij_sex_row > div:nth-child(3)
    Click Button   ${cont}   
    Sleep    3
    Input Box    ${phone_loc}    ${phone} 
    Click Button   ${next} 
    Sleep    1
    Page Should Contain    SMS


*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


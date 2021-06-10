*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_amazon}        https://www.amazon.com.tr
${input_mail}        xpath://*[@id="ap_email"]
${input_passw}       xpath://*[@id="ap_password"]
${mail}     yourmail
${passw}    yourpassword
${btn_cnt}    xpath://*[@id="continue"]
${btn_login}    xpath://*[@id="signInSubmit"]
${btn_item}     xpath://*[@id="zg_left_col1"]/div[1]/div[2]/div/div[2]/a
${com_profile}     xpath://span[@class="a-size-extra-large"]
${profile}    xpath://span[@class="a-profile-name"]
${cookie}    xpath://*[@id="sp-cc-accept"]
${signin}    xpath://*[@id="nav-flyout-ya-signin"]/a/span
#sleep 3s
*** Test Cases ***
Look the User profile from the comments
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button    ${cookie}  
    Mouse Over     partial link:Hesap
    Click Button    ${signin}   
    Input Box    ${input_mail}    ${mail} 
    Click Element  ${btn_cnt}
    Input Box    ${input_passw}    ${passw} 
    Click Element  ${btn_login}
    Sleep  1
    Click Link   partial link:Çok Satanlar
    ${url}=   Get Location
    Should Contain    ${url}    bestsellers
    Click Button    ${btn_item}
    Scroll Element Into View     //*[@id="reviewsMedley"]/div/div[2]
    Wait Until Element is visible    ${profile}    timeout=5s
    Set Focus To Element    ${profile} 
    ${nam}=   Get Text   ${profile}  
    Click Button    ${profile}
    Sleep  2
    ${com_profile}=     Get Text    ${com_profile}
    Should Be Equal    ${nam}    ${com_profile}

*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


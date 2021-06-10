* Settings *
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
* Variable *
${url_amazon}        https://www.amazon.com.tr
${input_mail}        xpath://*[@id="ap_email"]
${input_passw}       xpath://*[@id="ap_password"]
${input_name}    xpath://*[@id="address-ui-widgets-enterAddressFullName"]
${input_city}    xpath://*[@id="address-ui-widgets-enterAddressCity"]
${input_state}    xpath://*[@id="address-ui-widgets-enterAddressStateOrRegion"]
${input_county}    xpath://*[@id="address-ui-widgets-enterAddressDistrictOrCounty"]
${input_address1}    xpath://*[@id="address-ui-widgets-enterAddressLine1"]
${input_address2}    xpath://*[@id="address-ui-widgets-enterAddressLine2"]
${input_phone}    xpath://*[@id="address-ui-widgets-enterAddressPhoneNumber"]

${mail}     yourmail
${passw}    yourpassword
${user}    Ali
${name}     Ali Tunceli
${city}     İst
${state}     state
${county}     county
${address1}     addr1
${address2}     addr2
${phone}     yournumber

${btn_buy}      xpath://*[@id="buy-now-button"]
${btn_item}     xpath://*[@id="zg_left_col1"]/div[1]/div[2]/div/div[2]/a
${btn_cont}     xpath://*[@id="continue"]  
${btn_login}    xpath://*[@id="signInSubmit"]
${btn_teslim}    xpath://*[@id="GLUXSignInButton"]/span/input
${check}    xpath://*[@id="address-ui-widgets-use-as-my-default"]
${cookie}    xpath://*[@id="sp-cc-accept"]
#sleep 6s

* Test Cases *
Enter Adress after Buy Item   
   [tags]    success
    Maximize Browser Window
    Go To     ${url_amazon}
    Click Button   ${cookie}    
    Page Should Contain   Teslimat adres 
    Click Link   link:Çok Satanlar
    ${url}=   Get Location
    Should Contain    ${url}    bestsellers    
    Click Button    ${btn_item}
    Execute JavaScript    window.scrollTo(0, 300)
    Sleep  1
    Click Button    ${btn_buy}
    Input Box   ${input_mail}    ${mail}  
    Click Button    ${btn_cont} 
    Input Box    ${input_passw}    ${passw}   
    Click Button    ${btn_login}
    Sleep  1
    Input Box    ${input_name}    ${name}   
    Input Box    ${input_city}    ${city}  
    Sleep  1
    Press Keys    ${input_city}  ARROW_DOWN
    Sleep  1
    Press Keys    ${input_city}  ARROW_DOWN
    Sleep  1
    Press Keys    ${input_city}  ENTER
    Click Element    ${input_state} 
    Input Box    ${input_state}    ${state} 
    Sleep  1
    Input Box    ${input_address1}    ${address1}   
    Input Box    ${input_address2}    ${address2}   
    Input Box    ${input_phone}    ${phone}   
    Select Checkbox   ${check}

* Keywords *
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}
*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections
Library    XML
Suite Setup        Open Browser    about:blank    headlesschrome
Suite Teardown     Close All Browsers
*** Variable ***
${url_sucourse}        https://vk.com
${phone_path}    xpath://*[@id="index_email"]
${passw_path}    xpath://*[@id="index_pass"]
${sign_in}    xpath://*[@id="index_login_button"]

${phone}    phone
${password}    password
${upload}     xpath://*[@id="video_main_tabs"]/button[1]
${add_vid_site}     xpath://*[@id="video_upload_info"]/div[3]/button[2]
${video_path}     xpath://*[@id="video_external_link"]
${video}     https://www.youtube.com/watch?v=_cCrsqNmPmw
${save}     xpath://*[@id="box_layer"]/div[2]/div[1]/div[3]/div[1]/table/tbody/tr/td[1]/button
${video_search_input}     xpath://*[@id="video_search_input"]

*** Test Cases ***
Upload video
   [tags]    success
    Maximize Browser Window
    Go To     ${url_sucourse}
    Input Box    ${phone_path}    ${phone} 
    Input Box    ${passw_path}    ${password} 
    Click Button    ${sign_in}
    Sleep  4
    Click Link    partial link:Video
    Sleep  2
    ${url}=  Get Location
    Should Contain    ${url}    video
    Click Link    partial link:Video kayıtlarım
    Click Button     ${upload}
    Sleep    6
    Click Button    ${add_vid_site} 
    Input Box    ${video_path}    ${video}
    Sleep    2
    Click Button    ${save} 
    Sleep    1
 
*** Keywords ***
Input Box
    [Arguments]      ${xpath_mail}    ${mail}     
    Element Should Be Visible    ${xpath_mail}
    Input Text       ${xpath_mail}     ${mail}
Click Button
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element     ${btn}


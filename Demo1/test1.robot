*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${SERVER}         https://www.amazon.com/
${url2}           https://www.wapice.com/
${BROWSER}        Chrome
${DELAY}          0
${SEARCHWORD}     iphone 12
${link1}          link : Apple iPhone 12, 256GB, Blue - Unlocked (Renewed Premium)
${link2}          link : News & Events

*** Keywords ***
Open Server1
    OPEN BROWSER                ${SERVER}                           ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed          ${DELAY}

Search product
    input text                  id = twotabsearchtextbox            ${searchword}
    click button                id = nav-search-submit-button
    click element               ${link1}
Go Back
    Execute Javascript  history.back()

Different search
    go to  ${url2}
    click element  ${link2}
    sleep  20s


*** Test Cases ***
Demo Test
    Open Server1
    Search product
    Go Back
    Different search
    close browser


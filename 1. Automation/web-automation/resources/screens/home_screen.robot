*** Settings ***
Library      Browser
Variables    ../variables/env.py

*** Variables ***

${HEADER_MARKET_MENU}     xpath=(//a[contains(@href,'market')])[1]

${HEADER_ACADEMY_MENU}    xpath=(//a[contains(@href,'academy')])[1]

${HEADER_OTC_MENU}        xpath=(//a[contains(@href,'otc')])[1]

*** Keywords ***

Open Indodax Homepage

    Go To    ${BASE_URL}${MARKET_PATH}

Verify Homepage Loaded

    Wait For Elements State
    ...    ${HEADER_MARKET_MENU}
    ...    visible
    ...    timeout=20s

Verify Top Navigation Menus Exists

    Wait For Elements State
    ...    ${HEADER_MARKET_MENU}
    ...    visible
    ...    timeout=20s

    Wait For Elements State
    ...    ${HEADER_ACADEMY_MENU}
    ...    visible
    ...    timeout=20s

    Wait For Elements State
    ...    ${HEADER_OTC_MENU}
    ...    visible
    ...    timeout=20s

Navigate To Market Menu

    Click    ${HEADER_MARKET_MENU}
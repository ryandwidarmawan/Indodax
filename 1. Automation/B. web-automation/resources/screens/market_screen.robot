*** Settings ***
Library      Browser

*** Variables ***

${COIN_USDT_ROW}              xpath=(//a[contains(@href,'USDTIDR')])[1]

${COIN_BTC_ROW}               xpath=(//a[contains(@href,'BTCIDR')])[1]

${RADIO_TRADE_KLASIK}         xpath=//*[contains(text(),'Trade Klasik')]

${BUTTON_SIMPAN_TAMPILAN}     xpath=//*[contains(text(),'Simpan Tampilan')]

${BTC_DETAIL_INDICATOR}       xpath=//*[contains(text(),'BTC to IDR')]

*** Keywords ***

Verify Market Screen Loaded

    Wait For Elements State
    ...    ${COIN_USDT_ROW}
    ...    visible
    ...    timeout=20s

Verify USDT and BTC Coins Exists

    Wait For Elements State
    ...    ${COIN_USDT_ROW}
    ...    visible
    ...    timeout=20s

    Wait For Elements State
    ...    ${COIN_BTC_ROW}
    ...    visible
    ...    timeout=20s

Click BTC Coin Row

    Click    ${COIN_BTC_ROW}

Handle Trade Preference Popup

    ${popup_exist}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${RADIO_TRADE_KLASIK}
    ...    visible
    ...    timeout=10s

    IF    ${popup_exist}

        Click    ${RADIO_TRADE_KLASIK}

        Sleep    1s

        Click    ${BUTTON_SIMPAN_TAMPILAN}

        Sleep    5s

    END

Verify BTC Detail Page Loaded

    ${current_url}=    Get Url

    Should Contain
    ...    ${current_url}
    ...    BTCIDR

    Wait For Elements State
    ...    ${BTC_DETAIL_INDICATOR}
    ...    visible
    ...    timeout=30s
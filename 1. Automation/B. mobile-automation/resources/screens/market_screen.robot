*** Settings ***
Library    AppiumLibrary

*** Variables ***
# Locator Market Screen
${MARKET_TAB}      xpath=//*[@text='Market']
${BTC_COIN}        xpath=//*[@text='BTC']
${SEARCH_INPUT}    xpath=//*[contains(@text,'Search')]

# Locator BTC Detail Screen
${BTC_PRICE}       xpath=//*[contains(@text,'Bitcoin Price')]
${TIMEFRAME_1D}    xpath=//*[@text='1D']
${TIMEFRAME_1W}    xpath=//*[@text='1W']
${TIMEFRAME_1M}    xpath=//*[@text='1M']

# Locator News Screen
${NEWS_TAB}        xpath=//*[@text='News']
# Menggunakan 'ago' untuk mendeteksi item berita (berdasarkan '36m ago' di screenshot)
${NEWS_ITEM}       xpath=//*[contains(@text, 'ago')] 

*** Keywords ***
Go To Market Screen
    Wait Until Element Is Visible    ${MARKET_TAB}    20s
    Click Element    ${MARKET_TAB}

Verify Market Screen
    Wait Until Element Is Visible    ${SEARCH_INPUT}    20s
    Wait Until Element Is Visible    ${BTC_COIN}        20s

Verify Coins On Market
    Wait Until Element Is Visible    ${BTC_COIN}    20s

Open BTC Detail
    Click Element    ${BTC_COIN}

Verify BTC Detail
    Wait Until Element Is Visible    ${BTC_PRICE}      20s
    Wait Until Element Is Visible    ${TIMEFRAME_1D}   20s
    Wait Until Element Is Visible    ${TIMEFRAME_1W}   20s
    Wait Until Element Is Visible    ${TIMEFRAME_1M}   20s
    Wait Until Element Is Visible    ${NEWS_TAB}       20s

Open News Tab
    [Documentation]    Berpindah dari tab Market ke tab News di dalam Detail Koin
    Click Element    ${NEWS_TAB}
    Sleep    2s

Verify News Data
    [Documentation]    Memastikan list berita berhasil dimuat dengan mendeteksi timestamp item
    Wait Until Element Is Visible    ${NEWS_ITEM}    15s
    
    # Optional: Ambil salah satu teks untuk dibuktikan di log
    ${news_timestamp}=    Get Text    ${NEWS_ITEM}
    
    Log To Console    \n--- TAB NEWS BERHASIL DIMUAT ---
    Log To Console    Ditemukan artikel dengan waktu: ${news_timestamp}
    Log To Console    --------------------------------
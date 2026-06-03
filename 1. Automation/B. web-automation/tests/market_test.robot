*** Settings ***

Resource    ../resources/keywords/browser_keywords.robot
Resource    ../resources/screens/home_screen.robot
Resource    ../resources/screens/market_screen.robot

Suite Setup       Start Browser
Suite Teardown    Close Browser Session

*** Test Cases ***

Scenario 1 - Open Homepage

    Open Indodax Homepage
    Verify Homepage Loaded

Scenario 2 - Verify Top Menus

    Verify Top Navigation Menus Exists

Scenario 3 - Open Market And Verify Coins

    Navigate To Market Menu

    Verify Market Screen Loaded

    Verify USDT and BTC Coins Exists

Scenario 4 - Open BTC Detail

    Click BTC Coin Row

    Handle Trade Preference Popup

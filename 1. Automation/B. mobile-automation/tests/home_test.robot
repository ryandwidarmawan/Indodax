*** Settings ***
Resource    ../resources/keywords/mobile_keywords.robot
Resource    ../resources/screens/home_screen.robot
Resource    ../resources/screens/market_screen.robot

Suite Setup       Open Mobile Application
Suite Teardown    Close Mobile Application

*** Test Cases ***
Verify Home Screen
    Verify Home Loaded

Verify Bottom Navigation
    Verify Bottom Navigation Exists

Verify Market Screen
    Go To Market Screen
    Verify Market Screen

Verify Coins On Market
    Verify Coins On Market

Verify BTC Detail
    Open BTC Detail
    Verify BTC Detail

Verify BTC News Tab
    Open News Tab
    Verify News Data
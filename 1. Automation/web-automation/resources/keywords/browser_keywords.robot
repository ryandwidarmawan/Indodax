*** Settings ***
Library    Browser

*** Keywords ***

Start Browser

    New Browser
    ...    chromium
    ...    headless=False
    ...    args=["--start-maximized"]

    New Context
    ...    viewport=None

    New Page

Close Browser Session

    Close Browser
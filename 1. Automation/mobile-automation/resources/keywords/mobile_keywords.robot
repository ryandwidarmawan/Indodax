*** Settings ***
Library    AppiumLibrary
Variables    ../variables/env.py

*** Keywords ***

Open Mobile Application

    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=true

    Sleep    10s

Close Mobile Application

    Close Application
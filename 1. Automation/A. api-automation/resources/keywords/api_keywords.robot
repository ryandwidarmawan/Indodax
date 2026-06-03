*** Settings ***
Library    RequestsLibrary
Variables    ../variables/env.py

*** Keywords ***
Create API Session
    Create Session    indodax    ${BASE_URL}

Get All Pairs
    ${response}=    GET On Session
    ...    indodax
    ...    /api/pairs

    RETURN    ${response}
*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/validation_keywords.robot

Suite Setup    Create API Session

*** Test Cases ***
Verify Get Pairs API Success
    ${response}=    Get All Pairs

    Validate Status Code    ${response}
    Validate Response Is Not Empty    ${response}

Verify BTC Pair Exists
    ${response}=    Get All Pairs

    Validate BTC Pair Exists    ${response}

Verify Pair Schema Validation
    ${response}=    Get All Pairs

    ${json}=    Set Variable    ${response.json()}

    FOR    ${pair}    IN    @{json}

        Validate Pair Mandatory Fields    ${pair}

    END

Verify Expected Trading Pairs Exist
    ${response}=    Get All Pairs

    FOR    ${pair_name}    IN    @{EXPECTED_PAIRS}

        Validate Expected Pair Exists
        ...    ${response}
        ...    ${pair_name}

    END
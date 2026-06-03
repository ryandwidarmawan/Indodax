*** Settings ***
Library    Collections
Variables    ../variables/test_data.py

*** Keywords ***
Validate Status Code
    [Arguments]    ${response}

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    200

Validate Response Is Not Empty
    [Arguments]    ${response}

    Should Not Be Empty
    ...    ${response.json()}

Validate BTC Pair Exists
    [Arguments]    ${response}

    ${json}=    Set Variable    ${response.json()}

    ${found}=    Set Variable    ${False}

    FOR    ${item}    IN    @{json}

        IF    '${item["symbol"]}' == 'BTCIDR'
            ${found}=    Set Variable    ${True}
        END

    END

    Should Be True    ${found}

Validate Pair Mandatory Fields
    [Arguments]    ${pair}

    Dictionary Should Contain Key    ${pair}    id
    Dictionary Should Contain Key    ${pair}    symbol
    Dictionary Should Contain Key    ${pair}    ticker_id
    Dictionary Should Contain Key    ${pair}    base_currency
    Dictionary Should Contain Key    ${pair}    traded_currency

Validate Expected Pair Exists
    [Arguments]    ${response}    ${pair_name}

    ${json}=    Set Variable    ${response.json()}

    ${found}=    Set Variable    ${False}

    FOR    ${item}    IN    @{json}

        IF    '${item["symbol"]}' == '${pair_name}'
            ${found}=    Set Variable    ${True}
        END

    END

    Should Be True    ${found}
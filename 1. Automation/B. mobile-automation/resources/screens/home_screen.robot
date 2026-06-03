*** Variables ***

${HOME_NAV}        xpath=//*[@text='Home']
${MARKET_NAV}      xpath=//*[@text='Market']
${WALLET_NAV}      xpath=//*[@text='Wallet']

*** Keywords ***

Verify Home Loaded

    Wait Until Element Is Visible    ${HOME_NAV}    20s

Verify Bottom Navigation Exists

    Wait Until Element Is Visible    ${HOME_NAV}      10s
    Wait Until Element Is Visible    ${MARKET_NAV}    10s
    Wait Until Element Is Visible    ${WALLET_NAV}    10s
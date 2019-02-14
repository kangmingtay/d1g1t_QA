*** Settings ***

Documentation  Testing API calls for performance analysis chart in Monitor page 'Past Performance' tab.

Library  RequestsLibrary
Library  Collections

*** Variables ***

${DRILLDOWN_ID} =   "No Value"

*** Keywords ***


# Contribution Dimension - Strategy:

  # Total Return

Strategy - Total Return: Contribution

    [Documentation]     Checking 'Contribution' for 'Total Return' under Strategy

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Total Return: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Total Return' under Strategy

    ${metric} =                             Set Variable    "cumulative-return"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Total Return: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Total Return' under Strategy

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Total Return: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Total Return' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_cumul_ret"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


Strategy - Total Return: Contribution (3 Years)

    [Documentation]     Checking 3 Years 'Contribution' for 'Total Return' under Strategy

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "3 Years"
    ${date_range_value} =               Set Variable    "3_years"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Total Return: Contribution - Drilldown (3 Years)

    [Documentation]     Checking 3 Years 'Contribution - Drilldown' for 'Total Return' under Strategy

    ${metric} =                             Set Variable    "cumulative-return"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${date_range_label} =                   Set Variable    "3 Years"
    ${date_range_value} =                   Set Variable    "3_years"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Total Return: Client Position List (3 Years)

    [Documentation]     Checking 3 Years 'Client Position List' for 'Total Return' under Strategy

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "3 Years"
    ${date_range_value} =               Set Variable    "3_years"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Total Return: Infographic Monitor (3 Years)

    [Documentation]     Checking 3 Years 'Infographic Monitor' for 'Total Return' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_cumul_ret"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "3 Years"
    ${date_range_value} =               Set Variable    "3_years"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


Strategy - Total Return: Contribution (5 Years)

    [Documentation]     Checking 5 Years 'Contribution' for 'Total Return' under Strategy

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "5 Years"
    ${date_range_value} =               Set Variable    "5_years"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Total Return: Contribution - Drilldown (5 Years)

    [Documentation]     Checking 5 Years 'Contribution - Drilldown' for 'Total Return' under Strategy

    ${metric} =                             Set Variable    "cumulative-return"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${date_range_label} =                   Set Variable    "5 Years"
    ${date_range_value} =                   Set Variable    "5_years"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Total Return: Client Position List (5 Years)

    [Documentation]     Checking 5 Years 'Client Position List' for 'Total Return' under Strategy

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "5 Years"
    ${date_range_value} =               Set Variable    "5_years"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Total Return: Infographic Monitor (5 Years)

    [Documentation]     Checking 5 Years 'Infographic Monitor' for 'Total Return' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_cumul_ret"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "5 Years"
    ${date_range_value} =               Set Variable    "5_years"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


Strategy - Total Return: Contribution (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Contribution' for 'Total Return' under Strategy

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Year-to-Date"
    ${date_range_value} =               Set Variable    "ytd"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Total Return: Contribution - Drilldown (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Contribution - Drilldown' for 'Total Return' under Strategy

    ${metric} =                             Set Variable    "cumulative-return"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${date_range_label} =                   Set Variable    "Year-to-Date"
    ${date_range_value} =                   Set Variable    "ytd"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Total Return: Client Position List (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Client Position List' for 'Total Return' under Strategy

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Year-to-Date"
    ${date_range_value} =               Set Variable    "ytd"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Total Return: Infographic Monitor (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Infographic Monitor' for 'Total Return' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_cumul_ret"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Year-to-Date"
    ${date_range_value} =               Set Variable    "ytd"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


Strategy - Total Return: Contribution (Since Inception)

    [Documentation]     Checking 'Contribution' Since Inception for 'Total Return' under Strategy

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Total Return: Contribution - Drilldown (Since Inception)

    [Documentation]     Checking 'Contribution - Drilldown' Since Inception for 'Total Return' under Strategy

    ${metric} =                             Set Variable    "cumulative-return"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${date_range_label} =                   Set Variable    "Since Inception"
    ${date_range_value} =                   Set Variable    "since_inception"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Total Return: Client Position List (Since Inception)

    [Documentation]     Checking 'Client Position List' Since Inception for 'Total Return' under Strategy

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Total Return: Infographic Monitor (Since Inception)

    [Documentation]     Checking 'Infographic Monitor' Since Inception for 'Total Return' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_cumul_ret"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


  # Trailing Returns

Strategy - Trailing Returns: Contribution

    [Documentation]     Checking 'Contribution' for 'Trailing Returns' under Strategy

    ${metric} =                         Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Trailing Returns: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Trailing Returns' under Strategy

    ${metric} =                             Set Variable    "trailingReturns"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${date_range_label} =                   Set Variable    "Since Inception"
    ${date_range_value} =                   Set Variable    "since_inception"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Trailing Returns: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Trailing Returns' under Strategy

    ${metric} =                         Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Trailing Returns: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Trailing Returns' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


  # Return By Period

Strategy - Return By Period: Contribution

    [Documentation]     Checking 'Contribution' for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-by-period/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Return By Period: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Return By Period' under Strategy

    ${metric} =                             Set Variable    "monthlyReturns"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${drilldown_id} =                       Set Variable    "Cash & Cash Equivalent"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-drilldown-by-period/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Return By Period: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list-by-period/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Return By Period: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Return By Period' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_ret_by_period"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection

Strategy - Return By Period: Contribution (3 Years)

    [Documentation]     Checking 3 Years 'Contribution' for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "monthlyReturns"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "3 Years"
    ${date_range_value} =               Set Variable    "3_years"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-by-period/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Return By Period: Contribution - Drilldown (3 Years)

    [Documentation]     Checking 3 Years 'Contribution - Drilldown' for 'Return By Period' under Strategy

    ${metric} =                             Set Variable    "monthlyReturns"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${drilldown_id} =                       Set Variable    "Cash & Cash Equivalent"
    ${date_range_label} =                   Set Variable    "3 Years"
    ${date_range_value} =                   Set Variable    "3_years"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-drilldown-by-period/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Return By Period: Client Position List (3 Years)

    [Documentation]     Checking 3 Years 'Client Position List' for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${date_range_label} =               Set Variable    "3 Years"
    ${date_range_value} =               Set Variable    "3_years"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list-by-period/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Return By Period: Infographic Monitor (3 Years)

    [Documentation]     Checking 3 Years 'Infographic Monitor' for 'Return By Period' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_ret_by_period"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "3 Years"
    ${date_range_value} =               Set Variable    "3_years"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection

Strategy - Return By Period: Contribution (5 Years)

    [Documentation]     Checking 5 Years 'Contribution' for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "monthlyReturns"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "5 Years"
    ${date_range_value} =               Set Variable    "5_years"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-by-period/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Return By Period: Contribution - Drilldown (5 Years)

    [Documentation]     Checking 5 Years 'Contribution - Drilldown' for 'Return By Period' under Strategy

    ${metric} =                             Set Variable    "monthlyReturns"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${drilldown_id} =                       Set Variable    "Cash & Cash Equivalent"
    ${date_range_label} =                   Set Variable    "5 Years"
    ${date_range_value} =                   Set Variable    "5_years"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-drilldown-by-period/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Return By Period: Client Position List (5 Years)

    [Documentation]     Checking 5 Years 'Client Position List' for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${date_range_label} =               Set Variable    "5 Years"
    ${date_range_value} =               Set Variable    "5_years"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list-by-period/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Return By Period: Infographic Monitor (5 Years)

    [Documentation]     Checking 5 Years 'Infographic Monitor' for 'Return By Period' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_ret_by_period"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "5 Years"
    ${date_range_value} =               Set Variable    "5_years"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection

Strategy - Return By Period: Contribution (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Contribution' for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "monthlyReturns"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Year-to-Date"
    ${date_range_value} =               Set Variable    "ytd"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-by-period/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Return By Period: Contribution - Drilldown (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Contribution - Drilldown' for 'Return By Period' under Strategy

    ${metric} =                             Set Variable    "monthlyReturns"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${drilldown_id} =                       Set Variable    "Cash & Cash Equivalent"
    ${date_range_label} =                   Set Variable    "Year-to-Date"
    ${date_range_value} =                   Set Variable    "ytd"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-drilldown-by-period/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Return By Period: Client Position List (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Client Position List' for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${date_range_label} =               Set Variable    "Year-to-Date"
    ${date_range_value} =               Set Variable    "ytd"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list-by-period/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Return By Period: Infographic Monitor (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Infographic Monitor' for 'Return By Period' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_ret_by_period"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Year-to-Date"
    ${date_range_value} =               Set Variable    "ytd"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection

Strategy - Return By Period: Contribution (Since Inception)

    [Documentation]     Checking 'Contribution' Since Inception for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "monthlyReturns"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-by-period/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Return By Period: Contribution - Drilldown (Since Inception)

    [Documentation]     Checking 'Contribution - Drilldown' Since Inception for 'Return By Period' under Strategy

    ${metric} =                             Set Variable    "monthlyReturns"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${drilldown_id} =                       Set Variable    "Cash & Cash Equivalent"
    ${date_range_label} =                   Set Variable    "Since Inception"
    ${date_range_value} =                   Set Variable    "since_inception"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-drilldown-by-period/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Return By Period: Client Position List (Since Inception)

    [Documentation]     Checking 'Client Position List' Since Inception for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list-by-period/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Return By Period: Infographic Monitor (Since Inception)

    [Documentation]     Checking 'Infographic Monitor' Since Inception for 'Return By Period' under Strategy

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_ret_by_period"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection

        # Quarterly

Strategy - Quarterly Return By Period: Contribution

    [Documentation]     Checking Quarterly 'Contribution' for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "quarterlyReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${drilldown_id} =                   Set Variable    "Cash & Cash Equivalent"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-by-period/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Strategy

Strategy - Quarterly Return By Period: Contribution - Drilldown

    [Documentation]     Checking Quarterly 'Contribution - Drilldown' for 'Return By Period' under Strategy

    ${metric} =                             Set Variable    "quarterlyReturns"
    ${contribution_dimension} =             Set Variable    "Strategy"
    ${drilldown_id} =                       Set Variable    "Cash & Cash Equivalent"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-drilldown-by-period/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Strategy - Quarterly Return By Period: Client Position List

    [Documentation]     Checking Quarterly 'Client Position List' for 'Return By Period' under Strategy

    ${metric} =                         Set Variable    "quarterlyReturns"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list-by-period/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Strategy - Quarterly Return By Period: Infographic Monitor

    [Documentation]     Checking Quarterly 'Infographic Monitor' for 'Return By Period' under Strategy

    ${return_period_selection} =        Set Variable    "quarterlyReturns"
    ${metric_selection} =               Set Variable    "trend_ret_by_period"
    ${contribution_dimension} =         Set Variable    "Strategy"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


# Contribution Dimension - Asset Class:

  # Total Return

Asset Class - Total Return: Contribution

    [Documentation]     Checking 'Contribution' for 'Total Return' under Asset Class

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Asset Class"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Asset Class

Asset Class - Total Return: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Total Return' under Asset Class

    ${metric} =                             Set Variable    "cumulative-return"
    ${contribution_dimension} =             Set Variable    "Asset Class"
    ${drilldown_id} =                       Set Variable    "Equity"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Asset Class - Total Return: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Total Return' under Asset Class

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Asset Class"
    ${drilldown_id} =                   Set Variable    "Equity"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Asset Class - Total Return: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Total Return' under Asset Class

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_cumul_ret"
    ${contribution_dimension} =         Set Variable    "Asset Class"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


  # Trailing Returns

Asset Class - Trailing Returns: Contribution

    [Documentation]     Checking 'Contribution' for 'Trailing Returns' under Asset Class

    ${metric} =                         Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Asset Class"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${drilldown_id} =                   Set Variable    "Equity"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Asset Class

Asset Class - Trailing Returns: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Trailing Returns' under Asset Class

    ${metric} =                             Set Variable    "trailingReturns"
    ${contribution_dimension} =             Set Variable    "Asset Class"
    ${date_range_label} =                   Set Variable    "Since Inception"
    ${date_range_value} =                   Set Variable    "since_inception"
    ${drilldown_id} =                       Set Variable    "Equity"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Asset Class - Trailing Returns: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Trailing Returns' under Asset Class

    ${metric} =                         Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Asset Class"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${drilldown_id} =                   Set Variable    "Equity"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Asset Class - Trailing Returns: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Trailing Returns' under Asset Class

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Asset Class"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


  # Return By Period

Asset Class - Return By Period: Contribution

    [Documentation]     Checking 'Contribution' for 'Return By Period' under Asset Class

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Asset Class"
    ${drilldown_id} =                   Set Variable    "Equity"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-by-period/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Asset Class

Asset Class - Return By Period: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Return By Period' under Asset Class

    ${metric} =                             Set Variable    "monthlyReturns"
    ${contribution_dimension} =             Set Variable    "Asset Class"
    ${drilldown_id} =                       Set Variable    "Equity"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-drilldown-by-period/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Asset Class - Return By Period: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Return By Period' under Asset Class

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Asset Class"
    ${drilldown_id} =                   Set Variable    "Equity"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list-by-period/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status

    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Asset Class - Return By Period: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Return By Period' under Asset Class

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_ret_by_period"
    ${contribution_dimension} =         Set Variable    "Asset Class"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


# Contribution Dimension - Currency:

  # Total Return

Currency - Total Return: Contribution

    [Documentation]     Checking 'Contribution' for 'Total Return' under Currency

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Currency"
    ${drilldown_id} =                   Set Variable    "Equity"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Currency

Currency - Total Return: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Total Return' under Currency

    ${metric} =                             Set Variable    "cumulative-return"
    ${contribution_dimension} =             Set Variable    "Currency"
    ${drilldown_id} =                       Set Variable    "USD"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Currency - Total Return: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Total Return' under Currency

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Currency"
    ${drilldown_id} =                   Set Variable    "USD"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Currency - Total Return: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Total Return' under Currency

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_cumul_ret"
    ${contribution_dimension} =         Set Variable    "Currency"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


  # Trailing Returns

Currency - Trailing Returns: Contribution

    [Documentation]     Checking 'Contribution' for 'Trailing Returns' under Currency

    ${metric} =                         Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Currency"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${drilldown_id} =                   Set Variable    "USD"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Currency

Currency - Trailing Returns: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Trailing Returns' under Currency

    ${metric} =                             Set Variable    "trailingReturns"
    ${contribution_dimension} =             Set Variable    "Currency"
    ${date_range_label} =                   Set Variable    "Since Inception"
    ${date_range_value} =                   Set Variable    "since_inception"
    ${drilldown_id} =                       Set Variable    "USD"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Currency - Trailing Returns: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Trailing Returns' under Currency

    ${metric} =                         Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Currency"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${drilldown_id} =                   Set Variable    "USD"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Currency - Trailing Returns: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Trailing Returns' under Currency

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Currency"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


  # Return By Period

Currency - Return By Period: Contribution

    [Documentation]     Checking 'Contribution' for 'Return By Period' under Currency

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Currency"
    ${drilldown_id} =                   Set Variable    "USD"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-by-period/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Currency

Currency - Return By Period: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Return By Period' under Currency

    ${metric} =                             Set Variable    "monthlyReturns"
    ${contribution_dimension} =             Set Variable    "Currency"
    ${drilldown_id} =                       Set Variable    "CAD"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-drilldown-by-period/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Currency - Return By Period: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Return By Period' under Currency

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Currency"
    ${drilldown_id} =                   Set Variable    "CAD"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list-by-period/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status

    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Currency - Return By Period: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Return By Period' under Currency

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_ret_by_period"
    ${contribution_dimension} =         Set Variable    "Currency"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


# Contribution Dimension - Security:

  # Total Return

Security - Total Return: Contribution

    [Documentation]     Checking 'Contribution' for 'Total Return' under Security

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Security"
    ${drilldown_id} =                   Set Variable    "iShares S&P/TSX 60 ETF"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Security

Security - Total Return: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Total Return' under Security

    ${metric} =                             Set Variable    "cumulative-return"
    ${contribution_dimension} =             Set Variable    "Security"
    ${drilldown_id} =                       Set Variable    "iShares Russell 2000 ETF"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Security - Total Return: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Total Return' under Security

    ${metric} =                         Set Variable    "cumulative-return"
    ${contribution_dimension} =         Set Variable    "Security"
    ${drilldown_id} =                   Set Variable    "iShares Russell 2000 ETF"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Security - Total Return: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Total Return' under Security

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_cumul_ret"
    ${contribution_dimension} =         Set Variable    "Security"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


  # Trailing Returns

Security - Trailing Returns: Contribution

    [Documentation]     Checking 'Contribution' for 'Trailing Returns' under Security

    ${metric} =                         Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Security"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${drilldown_id} =                   Set Variable    "iShares Russell 2000 ETF"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Security

Security - Trailing Returns: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Trailing Returns' under Security

    ${metric} =                             Set Variable    "trailingReturns"
    ${contribution_dimension} =             Set Variable    "Security"
    ${date_range_label} =                   Set Variable    "Since Inception"
    ${date_range_value} =                   Set Variable    "since_inception"
    ${drilldown_id} =                       Set Variable    "iShares S&P/TSX 60 ETF"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contribution-drilldown/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Security - Trailing Returns: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Trailing Returns' under Security

    ${metric} =                         Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Security"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${date_range_value} =               Set Variable    "since_inception"
    ${drilldown_id} =                   Set Variable    "iShares S&P/TSX 60 ETF"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Security - Trailing Returns: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Trailing Returns' under Security

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trailingReturns"
    ${contribution_dimension} =         Set Variable    "Security"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection


  # Return By Period

Security - Return By Period: Contribution

    [Documentation]     Checking 'Contribution' for 'Return By Period' under Security

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Security"
    ${drilldown_id} =                   Set Variable    "iShares S&P/TSX 60 ETF"
    ${payload_contribution} =           Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-by-period/    data=${payload_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Security

Security - Return By Period: Contribution - Drilldown

    [Documentation]     Checking 'Contribution - Drilldown' for 'Return By Period' under Security

    ${metric} =                             Set Variable    "monthlyReturns"
    ${contribution_dimension} =             Set Variable    "Security"
    ${drilldown_id} =                       Set Variable    "iShares S&P/TSX 60 ETF"
    ${payload_contribution_drilldown} =     Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/contrib-drilldown-by-period/    data=${payload_contribution_drilldown}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        series

Security - Return By Period: Client Position List

    [Documentation]     Checking 'Client Position List' for 'Return By Period' under Security

    ${metric} =                         Set Variable    "monthlyReturns"
    ${contribution_dimension} =         Set Variable    "Security"
    ${drilldown_id} =                   Set Variable    "iShares S&P/TSX 60 ETF"
    ${payload_client_position_list} =   Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${DRILLDOWN_ID},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/client-position-list-by-period/    data=${payload_client_position_list}     headers=&{CONTENT_TYPE}

    # Check the Response status

    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        returnContribution

Security - Return By Period: Infographic Monitor

    [Documentation]     Checking 'Infographic Monitor' for 'Return By Period' under Security

    ${return_period_selection} =        Set Variable    "monthlyReturns"
    ${metric_selection} =               Set Variable    "trend_ret_by_period"
    ${contribution_dimension} =         Set Variable    "Security"
    ${payload_infographic_monitor} =    Set Variable    {"return_period_selection":${return_period_selection},"period_selection":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"metric_selection":${metric_selection},"contribution_dimension":${contribution_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api   /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/   data=${payload_infographic_monitor}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable    ${response.text}
    Should Contain     ${response_body}                         period_selection














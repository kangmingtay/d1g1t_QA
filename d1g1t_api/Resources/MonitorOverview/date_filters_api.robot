*** Settings ***

Documentation  Testing API calls in Monitor page 'Overview' tab for the Date Filters.

Library  RequestsLibrary
Library  Collections
Library  String
Library  robot.libraries.DateTime

Library  ../CustomLibraries/DateCalculations.py


*** Variables ***


*** Keywords ***


# Calculations for Date Filter : Today

Date Filter: Today - Summary Calculations

    [Documentation]     Checking calculations: Summary for date - Today
    [Tags]  CAD

    ${date_type} =      Set Variable            "today"
    ${date_label} =     Set Variable            "Today"
    ${date_value} =     current day

    ${payload_summary} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"label":"1 Year","value":"year"},"single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_summary}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: Today - Cumulative Return Calculations

    [Documentation]     Checking calculations: Cumulative Return for date - Today
    [Tags]  CAD

    ${date_type} =      Set Variable            "today"
    ${date_label} =     Set Variable            "Today"
    ${date_value} =     current day

    ${payload_cumulative_return} =  Set Variable    {"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":"FXincluded","metric_type":"$","time_series":"monthly","date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_cumulative_return}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: Today - PF Deposits Calculations

    [Documentation]     Checking calculations: PF Deposits for date - Today
    [Tags]  CAD

    ${date_type} =      Set Variable            "today"
    ${date_label} =     Set Variable            "Today"
    ${date_value} =     current day

    ${payload_pf_deposits} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"single_result":"false","date_range":{"label":"1 Year","value":"year"}}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_deposits}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: Today - PF Activity Group 1 Calculations

    [Documentation]     Checking calculations: PF Activity Group 1 for date - Today
    [Tags]  CAD

    ${date_type} =      Set Variable            "today"
    ${date_label} =     Set Variable            "Today"
    ${date_value} =     current day

    ${payload_pf_activity_group_1} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":"allocationChanges","drilldown_dimension":"assetClass","date_range":{"label":"1 Year","value":"year"},"time_series":"monthly","single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_activity_group_1}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories



# Calculations for Date Filter : Previous business day

Date Filter: Previous Business day - Summary Calculations

    [Documentation]     Checking calculations: Summary for date - Previous business day
    [Tags]  CAD

    ${date_type} =      Set Variable            "previousBusinessDay"
    ${date_label} =     Set Variable            "Previous business day"
    ${date_value} =     previous business day

    ${payload_summary} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"label":"1 Year","value":"year"},"single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_summary}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: Previous Business day - Cumulative Return Calculations

    [Documentation]     Checking calculations: Cumulative Return for date - Previous business day
    [Tags]  CAD

    ${date_type} =      Set Variable            "previousBusinessDay"
    ${date_label} =     Set Variable            "Previous business day"
    ${date_value} =     previous business day

    ${payload_cumulative_return} =  Set Variable    {"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":"FXincluded","metric_type":"$","time_series":"monthly","date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_cumulative_return}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: Previous Business day - PF Deposits Calculations

    [Documentation]     Checking calculations: PF Deposits for date - Previous business day
    [Tags]  CAD

    ${date_type} =      Set Variable            "previousBusinessDay"
    ${date_label} =     Set Variable            "Previous business day"
    ${date_value} =     previous business day

    ${payload_pf_deposits} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"single_result":"false","date_range":{"label":"1 Year","value":"year"}}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_deposits}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: Previous Business day - PF Activity Group 1 Calculations

    [Documentation]     Checking calculations: PF Activity Group 1 for date - Previous business day
    [Tags]  CAD

    ${date_type} =      Set Variable            "previousBusinessDay"
    ${date_label} =     Set Variable            "Previous business day"
    ${date_value} =     previous business day

    ${payload_pf_activity_group_1} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":"allocationChanges","drilldown_dimension":"assetClass","date_range":{"label":"1 Year","value":"year"},"time_series":"monthly","single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_activity_group_1}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories



# Calculations for Date Filter : End of previous week

Date Filter: End of previous week - Summary Calculations

    [Documentation]     Checking calculations: Summary for date - End of previous week
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousWeek"
    ${date_label} =     Set Variable            "End of previous week"
    ${date_value} =     end of previous week

    ${payload_summary} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"label":"1 Year","value":"year"},"single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_summary}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous week - Cumulative Return Calculations

    [Documentation]     Checking calculations: Cumulative Return for date - End of previous week
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousWeek"
    ${date_label} =     Set Variable            "End of previous week"
    ${date_value} =     end of previous week

    ${payload_cumulative_return} =  Set Variable    {"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":"FXincluded","metric_type":"$","time_series":"monthly","date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_cumulative_return}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous week - PF Deposits Calculations

    [Documentation]     Checking calculations: PF Deposits for date - End of previous week
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousWeek"
    ${date_label} =     Set Variable            "End of previous week"
    ${date_value} =     end of previous week

    ${payload_pf_deposits} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"single_result":"false","date_range":{"label":"1 Year","value":"year"}}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_deposits}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous week - PF Activity Group 1 Calculations

    [Documentation]     Checking calculations: PF Activity Group 1 for date - End of previous week
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousWeek"
    ${date_label} =     Set Variable            "End of previous week"
    ${date_value} =     end of previous week

    ${payload_pf_activity_group_1} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":"allocationChanges","drilldown_dimension":"assetClass","date_range":{"label":"1 Year","value":"year"},"time_series":"monthly","single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_activity_group_1}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories



# Calculations for Date Filter : End of previous month

Date Filter: End of previous month - Summary Calculations

    [Documentation]     Checking calculations: Summary for date - End of previous month
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousMonth"
    ${date_label} =     Set Variable            "End of previous month"
    ${date_value} =     end of previous month

    ${payload_summary} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"label":"1 Year","value":"year"},"single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_summary}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous month - Cumulative Return Calculations

    [Documentation]     Checking calculations: Cumulative Return for date - End of previous month
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousMonth"
    ${date_label} =     Set Variable            "End of previous month"
    ${date_value} =     end of previous month

    ${payload_cumulative_return} =  Set Variable    {"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":"FXincluded","metric_type":"$","time_series":"monthly","date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_cumulative_return}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous month - PF Deposits Calculations

    [Documentation]     Checking calculations: PF Deposits for date - End of previous month
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousMonth"
    ${date_label} =     Set Variable            "End of previous month"
    ${date_value} =     end of previous month

    ${payload_pf_deposits} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"single_result":"false","date_range":{"label":"1 Year","value":"year"}}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_deposits}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous month - PF Activity Group 1 Calculations

    [Documentation]     Checking calculations: PF Activity Group 1 for date - End of previous month
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousMonth"
    ${date_label} =     Set Variable            "End of previous month"
    ${date_value} =     end of previous month

    ${payload_pf_activity_group_1} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":"allocationChanges","drilldown_dimension":"assetClass","date_range":{"label":"1 Year","value":"year"},"time_series":"monthly","single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_activity_group_1}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories



# Calculations for Date Filter : End of previous quarter

Date Filter: End of previous quarter - Summary Calculations

    [Documentation]     Checking calculations: Summary for date - End of previous quarter
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousQuarter"
    ${date_label} =     Set Variable            "End of previous quarter"
    ${date_value} =     end of previous quarter

    ${payload_summary} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"label":"1 Year","value":"year"},"single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_summary}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous quarter - Cumulative Return Calculations

    [Documentation]     Checking calculations: Cumulative Return for date - End of previous quarter
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousQuarter"
    ${date_label} =     Set Variable            "End of previous quarter"
    ${date_value} =     end of previous quarter

    ${payload_cumulative_return} =  Set Variable    {"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":"FXincluded","metric_type":"$","time_series":"monthly","date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_cumulative_return}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous quarter - PF Deposits Calculations

    [Documentation]     Checking calculations: PF Deposits for date - End of previous quarter
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousQuarter"
    ${date_label} =     Set Variable            "End of previous quarter"
    ${date_value} =     end of previous quarter

    ${payload_pf_deposits} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"single_result":"false","date_range":{"label":"1 Year","value":"year"}}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_deposits}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous quarter - PF Activity Group 1 Calculations

    [Documentation]     Checking calculations: PF Activity Group 1 for date - End of previous quarter
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousQuarter"
    ${date_label} =     Set Variable            "End of previous quarter"
    ${date_value} =     end of previous quarter

    ${payload_pf_activity_group_1} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":"allocationChanges","drilldown_dimension":"assetClass","date_range":{"label":"1 Year","value":"year"},"time_series":"monthly","single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_activity_group_1}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories



# Calculations for Date Filter : End of previous year

Date Filter: End of previous year - Summary Calculations

    [Documentation]     Checking calculations: Summary for date - End of previous year
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousYear"
    ${date_label} =     Set Variable            "End of previous year"
    ${date_value} =     end of previous year

    ${payload_summary} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"label":"1 Year","value":"year"},"single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_summary}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous year - Cumulative Return Calculations

    [Documentation]     Checking calculations: Cumulative Return for date - End of previous year
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousYear"
    ${date_label} =     Set Variable            "End of previous year"
    ${date_value} =     end of previous year

    ${payload_cumulative_return} =  Set Variable    {"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":"FXincluded","metric_type":"$","time_series":"monthly","date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_cumulative_return}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous year - PF Deposits Calculations

    [Documentation]     Checking calculations: PF Deposits for date - End of previous year
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousYear"
    ${date_label} =     Set Variable            "End of previous year"
    ${date_value} =     end of previous year

    ${payload_pf_deposits} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"single_result":"false","date_range":{"label":"1 Year","value":"year"}}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_deposits}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Date Filter: End of previous year - PF Activity Group 1 Calculations

    [Documentation]     Checking calculations: PF Activity Group 1 for date - End of previous year
    [Tags]  CAD

    ${date_type} =      Set Variable            "endOfPreviousYear"
    ${date_label} =     Set Variable            "End of previous year"
    ${date_value} =     end of previous year

    ${payload_pf_activity_group_1} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${date_type},"label":${date_label},"date":${date_value}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":"allocationChanges","drilldown_dimension":"assetClass","date_range":{"label":"1 Year","value":"year"},"time_series":"monthly","single_result":"false"}}
    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_pf_activity_group_1}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories



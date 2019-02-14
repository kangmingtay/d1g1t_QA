*** Settings ***

Documentation  Testing API calls for past performance chart in Monitor page 'Overview' tab.

Library  RequestsLibrary
Library  Collections


*** Variables ***


*** Keywords ***


# Return Contribution:

Return Contribution: Light Cone Analysis (1 Year)

    [Documentation]     Checking 'Light Cone-Analysis' under "Return Contribution"

    ${past_view} =                          Set Variable    "return-contribution"
    ${present_view} =                       Set Variable    "concentration"
    ${future_view} =                        Set Variable    "future-risk-contrib"
    ${payload_light_cone_analysis} =        Set Variable    {"past_view":${past_view},"present_view":${present_view},"future_view":${future_view}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/LIGHT-CONE-ANALYTICS-MONITOR-OVERVIEW/      data=${payload_light_cone_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             past_view

Return Contribution: Return Contribution Overview (1 Year)

    [Documentation]     Checking 'Return Contribution Overview' under "Return Contribution"

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-CONTRIBUTION-MONITOR-OVERVIEW/

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

Return Contribution: Past Performance (1 Year)

    [Documentation]     Checking 'Past Performance' under "Return Contribution"

    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.239630-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.259507-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.236695-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"single_result":"undefined","date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-ret-contrib/      data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return Contribution

Return Contribution: Return Contribution Overview (1 Month)

    [Documentation]     Checking 1 Month 'Return Contribution Overview' under "Return Contribution"

    ${date_range_value} =                   Set Variable    "month"
    ${date_range_label} =                   Set Variable    "1 Month"
    ${payload_return_contribution} =        Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-CONTRIBUTION-MONITOR-OVERVIEW/      data=${payload_return_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return Contribution: Past Performance (1 Month)

    [Documentation]     Checking 1 Month 'Past Performance' under "Return Contribution"

    ${date_range_value} =               Set Variable    "month"
    ${date_range_label} =               Set Variable    "1 Month"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.239630-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.259507-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.236695-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"single_result":"undefined","date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-ret-contrib/      data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return Contribution

Return Contribution: Return Contribution Overview (3 Months)

    [Documentation]     Checking 3 Months 'Return Contribution Overview' under "Return Contribution"

    ${date_range_value} =                   Set Variable    "quarter"
    ${date_range_label} =                   Set Variable    "3 Months"
    ${payload_return_contribution} =        Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-CONTRIBUTION-MONITOR-OVERVIEW/      data=${payload_return_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return Contribution: Past Performance (3 Months)

    [Documentation]     Checking 3 Months 'Past Performance' under "Return Contribution"

    ${date_range_value} =               Set Variable    "quarter"
    ${date_range_label} =               Set Variable    "3 Months"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.239630-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.259507-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.236695-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"single_result":"undefined","date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-ret-contrib/      data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return Contribution

Return Contribution: Return Contribution Overview (6 Months)

    [Documentation]     Checking 6 Months 'Return Contribution Overview' under "Return Contribution"

    ${date_range_value} =                   Set Variable    "6_months"
    ${date_range_label} =                   Set Variable    "6 Months"
    ${payload_return_contribution} =        Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-CONTRIBUTION-MONITOR-OVERVIEW/      data=${payload_return_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return Contribution: Past Performance (6 Months)

    [Documentation]     Checking 6 Months 'Past Performance' under "Return Contribution"

    ${date_range_value} =               Set Variable    "6_months"
    ${date_range_label} =               Set Variable    "6 Months"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.239630-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.259507-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.236695-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"single_result":"undefined","date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-ret-contrib/      data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return Contribution

Return Contribution: Return Contribution Overview (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Return Contribution Overview' under "Return Contribution"

    ${date_range_value} =                   Set Variable    "ytd"
    ${date_range_label} =                   Set Variable    "Year-to-Date"
    ${payload_return_contribution} =        Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-CONTRIBUTION-MONITOR-OVERVIEW/      data=${payload_return_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return Contribution: Past Performance (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Past Performance' under "Return Contribution"

    ${date_range_value} =               Set Variable    "ytd"
    ${date_range_label} =               Set Variable    "Year-to-Date"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.239630-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.259507-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.236695-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"single_result":"undefined","date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-ret-contrib/      data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return Contribution

Return Contribution: Return Contribution Overview (3 Years)

    [Documentation]     Checking 3 Years 'Return Contribution Overview' under "Return Contribution"

    ${date_range_value} =                   Set Variable    "3_years"
    ${date_range_label} =                   Set Variable    "3 Years"
    ${payload_return_contribution} =        Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-CONTRIBUTION-MONITOR-OVERVIEW/      data=${payload_return_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return Contribution: Past Performance (3 Years)

    [Documentation]     Checking 3 Years 'Past Performance' under "Return Contribution"

    ${date_range_value} =               Set Variable    "3_years"
    ${date_range_label} =               Set Variable    "3 Years"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.239630-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.259507-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.236695-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"single_result":"undefined","date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-ret-contrib/      data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return Contribution

Return Contribution: Return Contribution Overview (5 Years)

    [Documentation]     Checking 5 Years 'Return Contribution Overview' under "Return Contribution"

    ${date_range_value} =                   Set Variable    "5_years"
    ${date_range_label} =                   Set Variable    "5 Years"
    ${payload_return_contribution} =        Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-CONTRIBUTION-MONITOR-OVERVIEW/      data=${payload_return_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return Contribution: Past Performance (5 Years)

    [Documentation]     Checking 5 Years 'Past Performance' under "Return Contribution"

    ${date_range_value} =               Set Variable    "5_years"
    ${date_range_label} =               Set Variable    "5 Years"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.239630-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.259507-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.236695-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"single_result":"undefined","date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-ret-contrib/      data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return Contribution

Return Contribution: Return Contribution Overview (Since Inception)

    [Documentation]     Checking 'Return Contribution Overview' Since Inception under "Return Contribution"

    ${date_range_value} =                   Set Variable    "since_inception"
    ${date_range_label} =                   Set Variable    "Since Inception"
    ${payload_return_contribution} =        Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-CONTRIBUTION-MONITOR-OVERVIEW/      data=${payload_return_contribution}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return Contribution: Past Performance (Since Inception)

    [Documentation]     Checking 'Past Performance' Since Inception under "Return Contribution"

    ${date_range_value} =               Set Variable    "since_inception"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.239630-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-29T17:39:11.259507-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.236695-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"single_result":"undefined","date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-ret-contrib/      data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return Contribution


# Return:

Return: Light Cone Analysis (1 Year)

    [Documentation]     Checking 'Light Cone-Analysis' under "Return"

    ${past_view} =                          Set Variable    "return"
    ${present_view} =                       Set Variable    "concentration"
    ${future_view} =                        Set Variable    "future-risk-contrib"
    ${payload_light_cone_analysis} =        Set Variable    {"past_view":${past_view},"future_view":${future_view},"present_view":${present_view}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/LIGHT-CONE-ANALYTICS-MONITOR-OVERVIEW/      data=${payload_light_cone_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             past_view

Return: Return Overview (1 Year)

    [Documentation]     Checking 'Return Overview' under "Return"

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-MONITOR-OVERVIEW/

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return: Past Performance (1 Year)

    [Documentation]     Checking 'Past Performance' under "Return"

    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.236695-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.236695-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-return/     data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return

Return: Return Overview (1 Month)

    [Documentation]     Checking 1 Month 'Return Overview' under "Return"

    ${date_range_value} =           Set Variable    "month"
    ${date_range_label} =           Set Variable    "1 Month"
    ${payload_return_overview} =    Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-MONITOR-OVERVIEW/      data=${payload_return_overview}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return: Past Performance (1 Month)

    [Documentation]     Checking 1 Month 'Past Performance' under "Return"

    ${date_range_value} =               Set Variable    "month"
    ${date_range_label} =               Set Variable    "1 Month"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-return/     data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return

Return: Return Overview (3 Months)

    [Documentation]     Checking 3 Months 'Return Overview' under "Return"

    ${date_range_value} =           Set Variable    "quarter"
    ${date_range_label} =           Set Variable    "3 Months"
    ${payload_return_overview} =    Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-MONITOR-OVERVIEW/      data=${payload_return_overview}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return: Past Performance (3 Months)

    [Documentation]     Checking 3 Months 'Past Performance' under "Return"

    ${date_range_value} =               Set Variable    "quarter"
    ${date_range_label} =               Set Variable    "3 Months"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-return/     data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return

Return: Return Overview (6 Months)

    [Documentation]     Checking 6 Months 'Return Overview' under "Return"

    ${date_range_value} =           Set Variable    "6_months"
    ${date_range_label} =           Set Variable    "6 Months"
    ${payload_return_overview} =    Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-MONITOR-OVERVIEW/      data=${payload_return_overview}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return: Past Performance (6 Months)

    [Documentation]     Checking 6 Months 'Past Performance' under "Return"

    ${date_range_value} =               Set Variable    "6_months"
    ${date_range_label} =               Set Variable    "6 Months"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-return/     data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return

Return: Return Overview (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Return Overview' under "Return"

    ${date_range_value} =           Set Variable    "ytd"
    ${date_range_label} =           Set Variable    "Year-to-Date"
    ${payload_return_overview} =    Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-MONITOR-OVERVIEW/      data=${payload_return_overview}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return: Past Performance (Year-to-Date)

    [Documentation]     Checking Year-to-Date 'Past Performance' under "Return"

    ${date_range_value} =               Set Variable    "ytd"
    ${date_range_label} =               Set Variable    "Year-to-Date"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-return/     data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return

Return: Return Overview (3 Years)

    [Documentation]     Checking 3 Years 'Return Overview' under "Return"

    ${date_range_value} =           Set Variable    "3_years"
    ${date_range_label} =           Set Variable    "3 Years"
    ${payload_return_overview} =    Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-MONITOR-OVERVIEW/      data=${payload_return_overview}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return: Past Performance (3 Years)

    [Documentation]     Checking 3 Years 'Past Performance' under "Return"

    ${date_range_value} =               Set Variable    "3_years"
    ${date_range_label} =               Set Variable    "3 Years"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-return/     data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return

Return: Return Overview (5 Years)

    [Documentation]     Checking 5 Years 'Return Overview' under "Return"

    ${date_range_value} =           Set Variable    "5_years"
    ${date_range_label} =           Set Variable    "5 Years"
    ${payload_return_overview} =    Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-MONITOR-OVERVIEW/      data=${payload_return_overview}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return: Past Performance (5 Years)

    [Documentation]     Checking 5 Years 'Past Performance' under "Return"

    ${date_range_value} =               Set Variable    "5_years"
    ${date_range_label} =               Set Variable    "5 Years"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-return/     data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return

Return: Return Overview (Since Inception)

    [Documentation]     Checking 'Return Overview' Since Inception under "Return"

    ${date_range_value} =           Set Variable    "since_inception"
    ${date_range_label} =           Set Variable    "Since Inception"
    ${payload_return_overview} =    Set Variable    {"view":"graph","period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/RETURN-MONITOR-OVERVIEW/      data=${payload_return_overview}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           graph

Return: Past Performance (Since Inception)

    [Documentation]     Checking 'Past Performance' Since Inception under "Return"

    ${date_range_value} =               Set Variable    "since_inception"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${payload_past_performance} =       Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/past-perf-return/     data=${payload_past_performance}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Return


# Present Exposure

Present Exposure

    [Documentation]     Checking Present Exposure (% of Portfolio)

    ${payload_present_exposure} =       Set Variable    {"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.967898-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/2/","id":2,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-31T10:04:11.990988-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"Name","display_precedence":100,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__display_name"},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/12/","id":12,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-01T10:13:26.575202-05:00","node_type":"Portfolio","custom_entity":"","node_depth":7,"query_string":"parent_portfolio__name","entity_id_query_string":"parent_portfolio__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__entity__content_type__model","display_name":"Fund Name","display_precedence":401,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/25/","id":25,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-28T15:39:34.884396-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__month","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Month","display_precedence":801,"use_for_column_expansion":false,"selection_display":{},"is_visible":true},{"url":"${BASE_URL}/api/v1/grouping-criteria/24/","id":24,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-01-23T13:33:14.271111-05:00","node_type":"Transaction","custom_entity":"","node_depth":8,"query_string":"%date_field%__year","entity_id_query_string":"","overridable_query_string":"","content_type_query_string":"","display_name":"Year","display_precedence":800,"use_for_column_expansion":false,"selection_display":{},"is_visible":true}],"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"display_data":{"show_current_data_only":false},"groups":null,"single_result":"undefined","compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/present-exposure/     data=${payload_present_exposure}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        percentage

























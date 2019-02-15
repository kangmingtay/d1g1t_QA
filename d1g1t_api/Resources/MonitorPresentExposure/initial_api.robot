*** Settings ***

Documentation  Testing API calls for 'Past Performance' tab.

Library  RequestsLibrary
Library  Collections

Library  ../CustomLibraries/DateCalculations.py


*** Variables ***

${VIEW_TYPE} =  "present"

*** Keywords ***


# First Load

Present Exposure: Global Filter

    [Documentation]     Checking 'Global Filter' API calls for "Present Exposure" tab

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api        /api/v1/profile/global-filter/

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           global-filter

Present Exposure: Global Selected Filter

    [Documentation]     Checking 'Global Selected Filter' API calls for "Present Exposure" tab

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api        /api/v1/profile/global-settings/global-selected-filter/

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

Present Exposure: Global Settings

    [Documentation]     Checking 'Global Settings' API calls for "Present Exposure" tab

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api        /api/v1/profile/global-settings/

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}           global-selected-filter

Present Exposure: Top Bottom Performers

    [Documentation]     Checking 'Top Bottom Performers' API calls for "Present Exposure" tab

    ${mover_type} =                     Set Variable    "top10"
    ${mover_entity_type} =              Set Variable    "Client"
    ${payload_top_bottom_performers} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":${VIEW_TYPE},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/top-bottom-performers/     data=${payload_top_bottom_performers}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}                            model_id

Present Exposure: Tickers Price

    [Documentation]     Checking 'Tickers Price' API calls for "Present Exposure" tab

    ${start_date} =             Two Weeks Ago
    ${end_date} =               Current Day
    ${payload_tickers_price} =  Set Variable    {"options":{"tickers":["GSPC","GSPTSE","ACWX","GC=F","IEF","CL=F","XBB","AGG","VIX","TNX"],"fx_rates":["USD/CAD"],"start_date":${start_date},"end_date":${end_date}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/market/tickers/tickersprice/     data=${payload_tickers_price}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}            price_statistics

Present Exposure: Graphic Info

    [Documentation]     Checking 'Graphic Info' API calls for "Present Exposure" tab

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api        /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PRESENT/

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

Present Exposure: First Selected View

    [Documentation]     Checking 'First Selected View' API calls for "Present Exposure" tab

    ${table_key"} =                     Set Variable    "CHART-CONCENTRATION-MONITOR-DRILLDOWN-PRESENT-FIRST"
    ${payload_first_selected_view} =    Set Variable    {"url":"${BASE_URL}/api/v1/profile/views/319/","table_key":${table_key"},"name":"Single","order":0,"groups":[{"id":1340,"group_item":{"url":"${BASE_URL}/api/v1/grouping-criteria/44/","id":44,"created":"2019-02-07T11:26:05.897288-05:00","modified":"2019-02-15T12:15:29.752741-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"ID","display_precedence":11,"use_for_column_expansion":false,"selection_display":{},"is_visible":true,"is_enum":false},"order":0,"user_view":319}],"filters":[],"metrics":[],"display_data":{"show_current_data_only":true},"is_last_period_first":false}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-CONCENTRATION-MONITOR-DRILLDOWN-PRESENT-FIRST-selectedView/   data=${payload_first_selected_view}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}            table_key

Present Exposure: Second Selected View

    [Documentation]     Checking 'Second Selected View' API calls for "Present Exposure" tab

    ${table_key"} =                     Set Variable    "CHART-CONCENTRATION-MONITOR-DRILLDOWN-PRESENT-SECOND"
    ${payload_second_selected_view} =   Set Variable    {"url":"${BASE_URL}/api/v1/profile/views/318/","table_key":${table_key"},"name":"Single","order":0,"groups":[{"id":1341,"group_item":{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-15T12:15:40.506939-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true,"is_enum":false},"order":0,"user_view":318}],"filters":[],"metrics":[],"display_data":{"show_current_data_only":true},"is_last_period_first":false}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-CONCENTRATION-MONITOR-DRILLDOWN-PRESENT-SECOND-selectedView/  data=${payload_second_selected_view}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}            table_key

Present Exposure: Third Selected View

    [Documentation]     Checking 'Third Selected View' API calls for "Present Exposure" tab

    ${table_key"} =                     Set Variable    "CHART-CONCENTRATION-MONITOR-DRILLDOWN-PRESENT-THIRD"
    ${payload_third_selected_view} =    Set Variable    {"url":"${BASE_URL}/api/v1/profile/views/317/","table_key":${table_key"},"name":"Single","order":0,"groups":[{"id":1343,"group_item":{"url":"${BASE_URL}/api/v1/grouping-criteria/3/","id":3,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-15T12:16:07.088791-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"ID","display_precedence":101,"use_for_column_expansion":false,"selection_display":{},"is_visible":true,"is_enum":false},"order":0,"user_view":317}],"filters":[],"metrics":[],"display_data":{"show_current_data_only":true},"is_last_period_first":false}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-CONCENTRATION-MONITOR-DRILLDOWN-PRESENT-THIRD-selectedView/   data=${payload_third_selected_view}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}            table_key

Present Exposure: Grouping Criteria - 44

    [Documentation]     Checking 'TGrouping Criteria - 44' API calls for "Present Exposure" tab

    ${payload_present_exposure} =  Set Variable    {"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/44/","id":44,"created":"2019-02-07T11:26:05.897288-05:00","modified":"2019-02-15T12:15:29.752741-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"ID","display_precedence":11,"use_for_column_expansion":false,"selection_display":{},"is_visible":true,"is_enum":false}],"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/44/","id":44,"created":"2019-02-07T11:26:05.897288-05:00","modified":"2019-02-15T12:15:29.752741-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"ID","display_precedence":11,"use_for_column_expansion":false,"selection_display":{},"is_visible":true,"is_enum":false}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"single_result":"undefined","compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/present-exposure/     data=${payload_present_exposure}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}            items

Present Exposure: Grouping Criteria - 1

    [Documentation]     Checking 'Grouping Criteria - 1' API calls for "Present Exposure" tab

    ${payload_present_exposure} =  Set Variable    {"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-15T12:15:40.506939-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true,"is_enum":false}],"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/1/","id":1,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-15T12:15:40.506939-05:00","node_type":"Household","custom_entity":"","node_depth":1,"query_string":"parent_portfolio__sleeve__account__client__household__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__household__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__household__entity__content_type__model","display_name":"Name","display_precedence":10,"use_for_column_expansion":false,"selection_display":{"firm_provided_key":"parent_portfolio__sleeve__account__client__household__name"},"is_visible":true,"is_enum":false}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"single_result":"undefined","compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/present-exposure/     data=${payload_present_exposure}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}            items

Present Exposure: Grouping Criteria - 3

    [Documentation]     Checking 'Grouping Criteria - 3' API calls for "Present Exposure" tab

    ${payload_present_exposure} =  Set Variable    {"groupings":[{"url":"${BASE_URL}/api/v1/grouping-criteria/3/","id":3,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-15T12:16:07.088791-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"ID","display_precedence":101,"use_for_column_expansion":false,"selection_display":{},"is_visible":true,"is_enum":false}],"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metrics":[],"groups":[{"url":"${BASE_URL}/api/v1/grouping-criteria/3/","id":3,"created":"2018-10-19T10:16:08.480602-04:00","modified":"2019-02-15T12:16:07.088791-05:00","node_type":"Client","custom_entity":"","node_depth":2,"query_string":"parent_portfolio__sleeve__account__client__firm_provided_key","entity_id_query_string":"parent_portfolio__sleeve__account__client__entity_id","overridable_query_string":"","content_type_query_string":"parent_portfolio__sleeve__account__client__entity__content_type__model","display_name":"ID","display_precedence":101,"use_for_column_expansion":false,"selection_display":{},"is_visible":true,"is_enum":false}],"filter":{"join_operator":"OR","items":[]},"display_data":{"show_current_data_only":true},"single_result":"undefined","compare":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/present-exposure/     data=${payload_present_exposure}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}            items

Present Exposure: Trend Analysis

    [Documentation]     Checking 'Trend Analysis' API calls for "Present Exposure" tab

    ${drilldown_dimension} =        Set Variable    "topLevel"
    ${domain_of_value} =            Set Variable    "portfolioReference"
    ${payload_trend_analysis} =     Set Variable    {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":${domain_of_value},"treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/trend-aum/     data=${payload_trend_analysis}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}            items

Present Exposure: Contribution

    [Documentation]     Checking 'Contribution' API calls for "Present Exposure" tab

    ${metric} =                     Set Variable    "currentWeight"
    ${contribution_dimension} =     Set Variable    "Strategy"
    ${drilldown_id} =               Set Variable    "No Value"
    ${payload_contribution} =       Set Variable    {"options":{"metric":${metric},"contribution_dimension":${contribution_dimension},"treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":${drilldown_id},"single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/contribution/     data=${payload_contribution}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}            percentage
















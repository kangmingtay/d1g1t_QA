*** Settings ***

Documentation  Testing API calls for 'Past Performance' tab.

Library  RequestsLibrary
Library  Collections

Library  ../CustomLibraries/DateCalculations.py


*** Variables ***


*** Keywords ***


# First Load

Past Performance: Global Filter

    [Documentation]     Checking 'Global Filter' API calls for "Past Performance" tab

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api        /api/v1/profile/global-filter/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           global-filter

Past Performance: Global Selected Filter

    [Documentation]     Checking 'Global Selected Filter' API calls for "Past Performance" tab

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api        /api/v1/profile/global-settings/global-selected-filter/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

Past Performance: Trend Analysis Chart

    [Documentation]     Checking 'Trend Analysis Chart' API calls for "Past Performance" tab

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Past Performance: Tickers Price

    [Documentation]     Checking 'Tickers Price' API calls for "Past Performance" tab

    ${start_date} =             two weeks ago
    ${end_date} =               current day
    ${payload_tickers_price} =  Set Variable    {"options":{"tickers":["GSPC","GSPTSE","ACWX","GC=F","IEF","CL=F","XBB","AGG","VIX","TNX"],"fx_rates":["USD/CAD"],"start_date":${start_date},"end_date":${end_date}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/market/tickers/tickersprice/     data=${payload_tickers_price}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}                            price_statistics

Past Performance: Graphic Info

    [Documentation]     Checking 'Graphic Info' API calls for "Past Performance" tab

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api        /api/v1/profile/global-settings/infographic:INFOGRAPHIC-MONITOR-DRILLDOWN-PAST/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

Past Performance: Performance Range

    [Documentation]     Checking 'Performance Range' API calls for "Past Performance" tab

    ${payload_performance_range} =  Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"group":"${BASE_URL}/api/v1/grouping-criteria/1/","metric":"return"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/performance-range/     data=${payload_performance_range}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}                            series

Past Performance: Contribution

    [Documentation]     Checking 'Contribution' API calls for "Past Performance" tab

    ${payload_contribution} =  Set Variable         {"options":{"metric":"cumulative-return","contribution_dimension":"Strategy","treatment_of_fx":${TREATMENT_OF_FX},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"drilldown_id":"No Value","single_result":"false"},"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/contribution/     data=${payload_contribution}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}                            Strategy

Past Performance: Cumulative Return

    [Documentation]     Checking 'Cumulative Return' API calls for "Past Performance" tab

    ${payload_cumulative_return} =  Set Variable                {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/trend-cumul-ret/     data=${payload_cumulative_return}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}                            Total Portfolio








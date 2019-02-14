*** Settings ***

Documentation  Testing API calls for trend analysis chart in Monitor page 'Past Performance' tab.

Library  RequestsLibrary
Library  Collections

*** Variables ***


*** Keywords ***


# Drilldown Dimension - Total Portfolio:

    # Total Return

Total Portfolio - Total Return: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Total Return for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Total Return: Trend (1 year)

    [Documentation]     Checking Trend in Total Return for Total Portfolio

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - FX separated Total Return: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Total Return for Total Portfolio (FX separated)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${treatment_of_fx} =           Set Variable     "FXseparated"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - FX separated Total Return: Trend (1 year)

    [Documentation]     Checking Trend in Total Return for Total Portfolio (FX separated)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${treatment_of_fx} =        Set Variable      "FXseparated"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Constant FX

Total Portfolio - Total Return: Trend Analysis Chart (1 Month)

    [Documentation]     Checking 1 Month Trend analysis chart in Total Return for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${date_range_label} =          Set Variable     "1 Month"
    ${date_range_value} =          Set Variable     "month"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Total Return: Trend (1 Month)

    [Documentation]     Checking 1 Month Trend in Total Return for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "1 Month"
    ${date_range_value} =       Set Variable        "month"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Total Return: Trend Analysis Chart (3 Months)

    [Documentation]     Checking 3 Months Trend analysis chart in Total Return for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${date_range_label} =          Set Variable     "3 Months"
    ${date_range_value} =          Set Variable     "quarter"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Total Return: Trend (3 Months)

    [Documentation]     Checking 3 Months Trend in Total Return for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "3 Months"
    ${date_range_value} =       Set Variable        "quarter"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Total Return: Trend Analysis Chart (6 Months)

    [Documentation]     Checking 6 Months Trend analysis chart in Total Return for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${date_range_label} =          Set Variable     "6 Months"
    ${date_range_value} =          Set Variable     "6_months"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Total Return: Trend (6 Months)

    [Documentation]     Checking 6 Months Trend in Total Return for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "6 Months"
    ${date_range_value} =       Set Variable        "6_months"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Total Return: Trend Analysis Chart (Year-to-Date)

    [Documentation]     Checking Year-to-Date Trend analysis chart in Total Return for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${date_range_label} =          Set Variable     "Year-to-Date"
    ${date_range_value} =          Set Variable     "ytd"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Total Return: Trend (Year-to-Date)

    [Documentation]     Checking Year-to-Date Trend in Total Return for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "Year-to-Date"
    ${date_range_value} =       Set Variable        "ytd"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Total Return: Trend Analysis Chart (3 Years)

    [Documentation]     Checking 3 Years Trend analysis chart in Total Return for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${date_range_label} =          Set Variable     "3 Years"
    ${date_range_value} =          Set Variable     "3_years"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Total Return: Trend (3 Years)

    [Documentation]     Checking 3 Years Trend in Total Return for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "3 Years"
    ${date_range_value} =       Set Variable        "3_years"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Total Return: Trend Analysis Chart (5 Years)

    [Documentation]     Checking 5 Years Trend analysis chart in Total Return for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${date_range_label} =          Set Variable     "5 Years"
    ${date_range_value} =          Set Variable     "5_years"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Total Return: Trend (5 Years)

    [Documentation]     Checking 5 Years Trend in Total Return for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "5 Years"
    ${date_range_value} =       Set Variable        "5_years"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Total Return: Trend Analysis Chart (Since Inception)

    [Documentation]     Checking Trend analysis Since Inception chart in Total Return for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${date_range_label} =          Set Variable     "Since Inception"
    ${date_range_value} =          Set Variable     "since_inception"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Total Return: Trend (Since Inception)

    [Documentation]     Checking Trend Since Inception in Total Return for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "Since Inception"
    ${date_range_value} =       Set Variable        "since_inception"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio


    # Return By Period

Total Portfolio - Return By Period: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Return By Period for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_ret_by_period"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Return By Period: Trend (1 year)

    [Documentation]     Checking Trend in Return By Period for Total Portfolio

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - FX separated Return By Period: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Return By Period for Total Portfolio (FX separated)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_ret_by_period"
    ${treatment_of_fx} =           Set Variable     "FXseparated"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - FX separated Return By Period: Trend (1 year)

    [Documentation]     Checking Trend in Return By Period for Total Portfolio (FX separated)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${treatment_of_fx} =        Set Variable      "FXseparated"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Constant FX

Total Portfolio - Return By Period: Trend Analysis Chart (1 Month)

    [Documentation]     Checking 1 Month Trend analysis chart in Return By Period for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_ret_by_period"
    ${date_range_label} =           Set Variable        "1 Month"
    ${date_range_value} =           Set Variable        "month"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Return By Period: Trend (1 Month)

    [Documentation]     Checking 1 Month Trend in Return By Period for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "1 Month"
    ${date_range_value} =       Set Variable        "month"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Return By Period: Trend Analysis Chart (3 Months)

    [Documentation]     Checking 3 Months Trend analysis chart in Return By Period for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_ret_by_period"
    ${date_range_label} =           Set Variable        "3 Months"
    ${date_range_value} =           Set Variable        "quarter"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Return By Period: Trend (3 Months)

    [Documentation]     Checking 3 Months Trend in Return By Period for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "3 Months"
    ${date_range_value} =       Set Variable        "quarter"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Return By Period: Trend Analysis Chart (6 Months)

    [Documentation]     Checking 6 Months Trend analysis chart in Return By Period for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_ret_by_period"
    ${date_range_label} =           Set Variable        "6 Months"
    ${date_range_value} =           Set Variable        "6_months"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Return By Period: Trend (6 Months)

    [Documentation]     Checking 6 Months Trend in Return By Period for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "6 Months"
    ${date_range_value} =       Set Variable        "6_months"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Return By Period: Trend Analysis Chart (Year-to-Date)

    [Documentation]     Checking Year-to-Date Trend analysis chart in Return By Period for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_ret_by_period"
    ${date_range_label} =           Set Variable        "Year-to-Date"
    ${date_range_value} =           Set Variable        "ytd"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Return By Period: Trend (Year-to-Date)

    [Documentation]     Checking Year-to-Date Trend in Return By Period for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "Year-to-Date"
    ${date_range_value} =       Set Variable        "ytd"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Return By Period: Trend Analysis Chart (3 Years)

    [Documentation]     Checking 3 Years Trend analysis chart in Return By Period for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_ret_by_period"
    ${date_range_label} =           Set Variable        "3 Years"
    ${date_range_value} =           Set Variable        "3_years"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Return By Period: Trend (3 Years)

    [Documentation]     Checking 3 Years Trend in Return By Period for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "3 Years"
    ${date_range_value} =       Set Variable        "3_years"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Return By Period: Trend Analysis Chart (5 Years)

    [Documentation]     Checking 5 Years Trend analysis chart in Return By Period for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_ret_by_period"
    ${date_range_label} =           Set Variable        "5 Years"
    ${date_range_value} =           Set Variable        "5_years"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Return By Period: Trend (5 Years)

    [Documentation]     Checking 5 Years Trend in Return By Period for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "5 Years"
    ${date_range_value} =       Set Variable        "5_years"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Return By Period: Trend Analysis Chart (Since Inception)

    [Documentation]     Checking Trend analysis chart Since Inception in Return By Period for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_ret_by_period"
    ${date_range_label} =           Set Variable        "Since Inception"
    ${date_range_value} =           Set Variable        "since_inception"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Return By Period: Trend (Since Inception)

    [Documentation]     Checking Trend Since Inception in Return By Period for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "Since Inception"
    ${date_range_value} =       Set Variable        "since_inception"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - 'Daily' Return By Period: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Return By Period for Total Portfolio (Daily)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_ret_by_period"
    ${time_series} =               Set Variable     "daily"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - 'Daily' Return By Period: Trend (1 year)

    [Documentation]     Checking Trend in Return By Period for Total Portfolio (Daily)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${time_series} =            Set Variable      "daily"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - 'Weekly' Return By Period: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Return By Period for Total Portfolio (Weekly)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_ret_by_period"
    ${time_series} =               Set Variable     "weekly"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - 'Weekly' Return By Period: Trend (1 year)

    [Documentation]     Checking Trend in Return By Period for Total Portfolio (Weekly)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${time_series} =            Set Variable      "weekly"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - 'Quarterly' Return By Period: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Return By Period for Total Portfolio (Quarterly)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_ret_by_period"
    ${time_series} =               Set Variable     "quarterly"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - 'Quarterly' Return By Period: Trend (1 year)

    [Documentation]     Checking Trend in Return By Period for Total Portfolio (Quarterly)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${time_series} =            Set Variable      "quarterly"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio


   # Realized Volatility

Total Portfolio - Realized Volatility: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${graph_view} =                Set Variable     "trend_realizd_volat"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Realized Volatility: Trend (1 year)

    [Documentation]     Checking Trend in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-realizd-volat/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Realized Volatility: Trend Analysis Chart (1 Month)

    [Documentation]     Checking 1 Month Trend analysis chart in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_realizd_volat"
    ${date_range_label} =           Set Variable        "1 Month"
    ${date_range_value} =           Set Variable        "month"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Realized Volatility: Trend (1 Month)

    [Documentation]     Checking 1 Month Trend in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "1 Month"
    ${date_range_value} =       Set Variable        "month"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-realizd-volat/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Realized Volatility: Trend Analysis Chart (3 Months)

    [Documentation]     Checking 3 Months Trend analysis chart in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_realizd_volat"
    ${date_range_label} =           Set Variable        "3 Months"
    ${date_range_value} =           Set Variable        "quarter"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Realized Volatility: Trend (3 Months)

    [Documentation]     Checking 3 Months Trend in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "3 Months"
    ${date_range_value} =       Set Variable        "quarter"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-realizd-volat/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Realized Volatility: Trend Analysis Chart (6 Months)

    [Documentation]     Checking 6 Months Trend analysis chart in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_realizd_volat"
    ${date_range_label} =           Set Variable        "6 Months"
    ${date_range_value} =           Set Variable        "6_months"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Realized Volatility: Trend (6 Months)

    [Documentation]     Checking 6 Months Trend in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "6 Months"
    ${date_range_value} =       Set Variable        "6_months"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-realizd-volat/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Realized Volatility: Trend Analysis Chart (Year-to-Date)

    [Documentation]     Checking Year-to-Date Trend analysis chart in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_realizd_volat"
    ${date_range_label} =           Set Variable        "Year-to-Date"
    ${date_range_value} =           Set Variable        "ytd"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Realized Volatility: Trend (Year-to-Date)

    [Documentation]     Checking Year-to-Date Trend in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "Year-to-Date"
    ${date_range_value} =       Set Variable        "ytd"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-realizd-volat/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Realized Volatility: Trend Analysis Chart (3 Years)

    [Documentation]     Checking 3 Years Trend analysis chart in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_realizd_volat"
    ${date_range_label} =           Set Variable        "3 Years"
    ${date_range_value} =           Set Variable        "3_years"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Realized Volatility: Trend (3 Years)

    [Documentation]     Checking 3 Years Trend in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "3 Years"
    ${date_range_value} =       Set Variable        "3_years"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-realizd-volat/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Realized Volatility: Trend Analysis Chart (5 Years)

    [Documentation]     Checking 5 Years Trend analysis chart in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_realizd_volat"
    ${date_range_label} =           Set Variable        "5 Years"
    ${date_range_value} =           Set Variable        "5_years"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Realized Volatility: Trend (5 Years)

    [Documentation]     Checking 5 Years Trend in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "5 Years"
    ${date_range_value} =       Set Variable        "5_years"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-realizd-volat/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Total Portfolio - Realized Volatility: Trend Analysis Chart (Since Inception)

    [Documentation]     Checking Trend analysis chart Since Inception in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =        Set Variable        "topLevel"
    ${graph_view} =                 Set Variable        "trend_realizd_volat"
    ${date_range_label} =           Set Variable        "Since Inception"
    ${date_range_value} =           Set Variable        "since_inception"
    ${payload_trend_analysis} =     Set Variable        {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Total Portfolio - Realized Volatility: Trend (Since Inception)

    [Documentation]     Checking Trend Since Inception in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =    Set Variable        "topLevel"
    ${date_range_label} =       Set Variable        "Since Inception"
    ${date_range_value} =       Set Variable        "since_inception"
    ${payload_trend} =          Set Variable        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-realizd-volat/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio


# Drilldown Dimension - Asset Class:

    # Total Return

Asset Class - Total Return: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Total Return for Asset Class

    ${drilldown_dimension} =       Set Variable     "assetClass"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Asset Class - Total Return: Trend (1 year)

    [Documentation]     Checking Trend in Total Return for Asset Class

    ${drilldown_dimension} =    Set Variable      "assetClass"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Return By Period

Asset Class - Return By Period: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Return By Period for Asset Class

    ${drilldown_dimension} =       Set Variable     "assetClass"
    ${graph_view} =                Set Variable     "trend_ret_by_period"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Asset Class - Return By Period: Trend (1 year)

    [Documentation]     Checking Trend in Return By Period for Asset Class

    ${drilldown_dimension} =    Set Variable      "assetClass"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


# Drilldown Dimension - Currency:

    # Total Return

Currency - Total Return: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Total Return for Currency

    ${drilldown_dimension} =       Set Variable     "currency"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Currency - Total Return: Trend (1 year)

    [Documentation]     Checking Trend in Total Return for Currency

    ${drilldown_dimension} =    Set Variable      "currency"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        CAD


    # Return By Period

Currency - Return By Period: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Return By Period for Currency

    ${drilldown_dimension} =       Set Variable     "currency"
    ${graph_view} =                Set Variable     "trend_ret_by_period"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Currency - Return By Period: Trend (1 year)

    [Documentation]     Checking Trend in Return By Period for Currency

    ${drilldown_dimension} =    Set Variable      "currency"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        CAD



# Drilldown Dimension - Strategy:

    # Total Return

Strategy - Total Return: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Total Return for Strategy

    ${drilldown_dimension} =       Set Variable     "strategy"
    ${graph_view} =                Set Variable     "trend_cumul_ret"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Strategy - Total Return: Trend (1 year)

    [Documentation]     Checking Trend in Total Return for Strategy

    ${drilldown_dimension} =    Set Variable      "strategy"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Return By Period

Strategy - Return By Period: Trend Analysis Chart (1 year)

    [Documentation]     Checking Trend analysis chart in Return By Period for Strategy

    ${drilldown_dimension} =       Set Variable     "strategy"
    ${graph_view} =                Set Variable     "trend_ret_by_period"
    ${payload_trend_analysis} =    Set Variable     {"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"graph_min_date":"2018-12-18T19:08:08.969Z","graph_max_date":"2018-12-18T19:08:08.969Z","time_series":${TIME_SERIES},"graph_view":${graph_view},"added_benchmarks":null,"benchmarks":[],"added_benchmark_name":"","response":{"data":null,"error":null,"loading":false}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-DRILLDOWN-PAST/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Strategy - Return By Period: Trend (1 year)

    [Documentation]     Checking Trend in Return By Period for Strategy

    ${drilldown_dimension} =    Set Variable      "strategy"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent

























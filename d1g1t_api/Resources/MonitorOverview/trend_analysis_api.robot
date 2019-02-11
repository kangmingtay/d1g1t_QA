*** Settings ***

Documentation  Testing API calls for trend analysis chart in Monitor page 'Overview' tab.

Library  RequestsLibrary
Library  Collections


*** Variables ***


*** Keywords ***


# Drilldown Dimension - Total Portfolio:

    # Assets Under Management

Total Portfolio - Assets Under Management: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Assets Under Management for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_aum","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Total Portfolio - Assets Under Management: Trend

    [Documentation]     Checking Trend in Assets Under Management for Total Portfolio

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-aum/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio


    # Cumulative Return

Total Portfolio - Cumulative Return: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Cumulative Return for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_cumul_ret","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Total Portfolio - Cumulative Return: Trend

    [Documentation]     Checking Trend in Cumulative Return for Total Portfolio

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/       data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio


   # Cumulative Return - FXseparated

Total Portfolio - Cumulative Return (FXseparated): Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Cumulative Return for Total Portfolio (FXseparated)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${treatment_of_fx} =           Set Variable     "FXseparated"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_cumul_ret","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Total Portfolio - Cumulative Return (FXseparated): Trend

    [Documentation]     Checking Trend in Cumulative Return for Total Portfolio (FXseparated)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${treatment_of_fx} =        Set Variable     "FXseparated"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/       data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Constant FX


    # Return By Period - Monthly

Total Portfolio - Return By Period (monthly): Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Return By Period for Total Portfolio (Time series: Monthly)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_ret_by_period","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Total Portfolio - Return By Period (monthly): Trend

    [Documentation]     Checking Trend in Return By Period for Total Portfolio (Time series: Monthly)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio


    # Return By Period - Monthly (FXseparated)

Total Portfolio - Return By Period (monthly - FXseparated): Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in 'Return By Period' for 'Total Portfolio' (Time series: Monthly, FXseparated)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${treatment_of_fx} =           Set Variable     "FXseparated"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_ret_by_period","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Total Portfolio - Return By Period (monthly - FXseparated): Trend

    [Documentation]     Checking Trend in 'Return By Period' for 'Total Portfolio' (Time series: Monthly, FXseparated)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${treatment_of_fx} =        Set Variable     "FXseparated"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Constant FX


    # Return By Period - Daily

Total Portfolio - Return By Period (daily): Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Return By Period for Total Portfolio (Time series: Daily)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${time_series} =               Set Variable     "daily"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_ret_by_period","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Total Portfolio - Return By Period (daily): Trend

    [Documentation]     Checking Trend in Return By Period for Total Portfolio (Time series: Daily)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${time_series} =            Set Variable      "daily"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio


    # Return By Period - Weekly

Total Portfolio - Return By Period (weekly): Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Return By Period for Total Portfolio (Time series: Weekly)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${time_series} =               Set Variable     "weekly"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_ret_by_period","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Total Portfolio - Return By Period (weekly): Trend

    [Documentation]     Checking Trend in Return By Period for Total Portfolio (Time series: Weekly)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${time_series} =            Set Variable      "weekly"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio


    # Return By Period - Quarterly

Total Portfolio - Return By Period (quarterly): Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Return By Period for Total Portfolio (Time series: Quarterly)

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${time_series} =               Set Variable     "quarterly"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_ret_by_period","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Total Portfolio - Return By Period (quarterly): Trend

    [Documentation]     Checking Trend in Return By Period for Total Portfolio (Time series: Quarterly)

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${time_series} =            Set Variable      "quarterly"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio


    # Realized Volatility

Total Portfolio - Realized Volatility: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =       Set Variable     "topLevel"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_realizd_volat","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Total Portfolio - Realized Volatility: Trend

    [Documentation]     Checking Trend in Realized Volatility for Total Portfolio

    ${drilldown_dimension} =    Set Variable      "topLevel"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-realizd-volat/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio



# Drilldown Dimension - Asset Class:

    # Assets Under Management

Asset Class - Assets Under Management: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Assets Under Management for Asset Class

    ${drilldown_dimension} =       Set Variable     "assetClass"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_aum","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Asset Class - Assets Under Management: Trend

    [Documentation]     Checking Trend in Assets Under Management for Asset Class

    ${drilldown_dimension} =    Set Variable      "assetClass"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-aum/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Allocation - Monthly

Asset Class - Allocation (monthly): Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Allocation for Asset Class (Time series: Monthly)

    ${drilldown_dimension} =       Set Variable     "assetClass"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_alloc","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Asset Class - Allocation (monthly): Trend

    [Documentation]     Checking Trend in Allocation for Asset Class (Time series: Monthly)

    ${drilldown_dimension} =    Set Variable      "assetClass"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-alloc/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Allocation - Quarterly

Asset Class - Allocation (quarterly): Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Allocation for Asset Class (Time series: Quarterly)

    ${drilldown_dimension} =       Set Variable     "assetClass"
    ${time_series} =               Set Variable     "quarterly"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_alloc","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Asset Class - Allocation (quarterly): Trend

    [Documentation]     Checking Trend in Allocation for Asset Class (Time series: Quarterly)

    ${drilldown_dimension} =    Set Variable      "assetClass"
    ${time_series} =            Set Variable      "quarterly"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-alloc/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Cumulative Return

Asset Class - Cumulative Return: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Cumulative Return for Asset Class

    ${drilldown_dimension} =       Set Variable     "assetClass"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_cumul_ret","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Asset Class - Cumulative Return: Trend

    [Documentation]     Checking Trend in Cumulative Return for Asset Class

    ${drilldown_dimension} =    Set Variable      "assetClass"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/       data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Return By Period

Asset Class - Return By Period: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Return By Period for Asset Class

    ${drilldown_dimension} =       Set Variable     "assetClass"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_ret_by_period","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Asset Class - Return By Period: Trend

    [Documentation]     Checking Trend in Return By Period for Asset Class

    ${drilldown_dimension} =    Set Variable      "assetClass"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent



# Drilldown Dimension - Currency:

    # Assets Under Management

Currency - Assets Under Management: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Assets Under Management for Currency

    ${drilldown_dimension} =       Set Variable     "currency"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_aum","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Currency - Assets Under Management: Trend

    [Documentation]     Checking Trend in Assets Under Management for Currency

    ${drilldown_dimension} =    Set Variable      "currency"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-aum/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        CAD


    # Allocation

Currency - Allocation: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Allocation for Currency

    ${drilldown_dimension} =       Set Variable     "currency"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_alloc","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Currency - Allocation: Trend

    [Documentation]     Checking Trend in Allocation for Currency

    ${drilldown_dimension} =    Set Variable      "currency"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-alloc/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        CAD


    # Cumulative Return

Currency - Cumulative Return: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Cumulative Return for Currency

    ${drilldown_dimension} =       Set Variable     "currency"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_cumul_ret","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Currency - Cumulative Return: Trend

    [Documentation]     Checking Trend in Cumulative Return for Currency

    ${drilldown_dimension} =    Set Variable      "currency"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/       data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        CAD


    # Return By Period

Currency - Return By Period: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Return By Period for Currency

    ${drilldown_dimension} =       Set Variable     "currency"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_ret_by_period","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Currency - Return By Period: Trend

    [Documentation]     Checking Trend in Return By Period for Currency

    ${drilldown_dimension} =    Set Variable      "currency"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        CAD


# Drilldown Dimension - Strategy:

    # Assets Under Management

Strategy - Assets Under Management: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Assets Under Management for Strategy

    ${drilldown_dimension} =       Set Variable     "strategy"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_aum","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Strategy - Assets Under Management: Trend

    [Documentation]     Checking Trend in Assets Under Management for Strategy

    ${drilldown_dimension} =    Set Variable      "strategy"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-aum/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Allocation

Strategy - Allocation: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Allocation for Strategy

    ${drilldown_dimension} =       Set Variable     "strategy"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_alloc","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Strategy - Allocation: Trend

    [Documentation]     Checking Trend in Allocation for Strategy

    ${drilldown_dimension} =    Set Variable      "strategy"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-alloc/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Cumulative Return

Strategy - Cumulative Return: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Cumulative Return for Strategy

    ${drilldown_dimension} =       Set Variable     "strategy"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_cumul_ret","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Strategy - Cumulative Return: Trend

    [Documentation]     Checking Trend in Cumulative Return for Strategy

    ${drilldown_dimension} =    Set Variable      "strategy"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-cumul-ret/       data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Return By Period

Strategy - Return By Period: Trend Analysis Chart

    [Documentation]     Checking Trend analysis chart in Return By Period for Strategy

    ${drilldown_dimension} =       Set Variable     "strategy"
    ${payload_trend_analysis} =    Set Variable     {"benchmarks":[],"date_range":{"value":"year","label":"1 Year"},"graph_view":"trend_ret_by_period","metric_type":"$","time_series":${TIME_SERIES},"graph_max_date":"2018-12-17T19:26:32.743Z","graph_min_date":"2018-12-17T19:26:32.743Z","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"added_benchmarks":null,"drilldown_dimension":${drilldown_dimension},"added_benchmark_name":""}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/      data=${payload_trend_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             time_series

Strategy - Return By Period: Trend

    [Documentation]     Checking Trend in Return By Period for Strategy

    ${drilldown_dimension} =    Set Variable      "strategy"
    ${payload_trend} =          Set Variable      {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":${drilldown_dimension},"domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":"1 Year","value":"year"},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/trend-ret-by-period/      data=${payload_trend}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


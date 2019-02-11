*** Settings ***

Documentation  Testing API calls in Monitor page 'Overview' tab.

Library  RequestsLibrary
Library  Collections
Library  String

Library  ../CustomLibraries/DateCalculations.py

*** Variables ***

${ENV} =                                dev
${BASE_URL} =                           https://api-${ENV}.d1g1twealth.com
${Firm_NAME} =                          R2
${USER_NAME} =                          mahmudul.robin@d1g1t.com
${PASSWORD} =                           p@ssw0rd!
${PAYLOAD_LOGIN_CREDENTIALS} =          {"username":"mahmudul.robin@d1g1t.com","password":"p@ssw0rd!"}
${USER_FIRST_NAME} =                    Mahmudul
${USER_LAST_NAME} =                     Robin

${DATE_TYPE} =                          "specificDate"
${DATE_LABEL} =                         "Specific date"
${DATE_VALUE} =                         "2018-07-31"
${DATE_RANGE_VALUE} =                   "year"
${DATE_RANGE_LABEL} =                   "1 Year"
${TIME_SERIES} =                        "monthly"
${TREATMENT_OF_FX} =                    "FXincluded"

&{CONTENT_TYPE} =                       Content-Type=application/json


*** Keywords ***

# Initial API calls in 'Monitor - Overview' tab

Verify User Login

    [Documentation]     Checking user login with valid username and password

    # Create Session for d1g1t API
    ${session_auth}=  Create List  ${USER_NAME}   ${PASSWORD}

    Create Session    d1g1t_api                                 https://api-${ENV}.d1g1twealth.com      auth=${session_auth}      disable_warnings=1

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/auth/login/     data=${PAYLOAD_LOGIN_CREDENTIALS}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             token

System Status

    [Documentation]     Checking system status

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/system-status/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             started

Global Filter

    [Documentation]     Checking global filter for authorized user

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/profile/global-filter/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           global-filter

Global Selected Filter

    [Documentation]     Checking global selected filter for authorized user

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/profile/global-settings/global-selected-filter/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

Current Firm Configuration

    [Documentation]     Checking current firm configuration for authorized user

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/people/firm-configuration/current/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body['firm']}   ${Firm_NAME}

    log  The configured firm for the current user is: ${Firm_NAME}

Current User

    [Documentation]     Checking the current user

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/auth/me/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}  ${USER_NAME}

    ${user_profile_path} =  fetch from right  ${response_body['profile']}  com
    Set Global Variable  ${USER_PROFILE_PATH}

    ${current_user} =  Set Variable  ${response_body['first_name']}  ${response_body['last_name']}
    log  Name of the current user is: ${current_user}

Current User Profile

    [Documentation]     Checking current user profile

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    ${USER_PROFILE_PATH}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body['user']}   ${USER_NAME}

Ticker Price

    [Documentation]     Checking the ticker price

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

Grouping Criteria

    [Documentation]     Checking grouping criteria

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/grouping-criteria/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             count

Monitor Overview: Trend Analysis Chart

    [Documentation]     Checking monitor overview: Trend analysis chart

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/profile/global-settings/CHART-TREND-ANALYSIS-MONITOR-OVERVIEW/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             date_range

Monitor Overview: Summary Statistics

    [Documentation]     Checking monitor overview: Summary statistics

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/profile/global-settings/SUMMARY-STATISTICS-MONITOR-OVERVIEW/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             period

Monitor Overview: Light Cone Analysis

    [Documentation]     Checking monitor overview: Light cone analysis

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/profile/global-settings/LIGHT-CONE-ANALYTICS-MONITOR-OVERVIEW/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

Monitor Overview: Portfolio Activity

    [Documentation]     Checking monitor overview: Portfolio activity

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/profile/global-settings/portfolio-activity:monitor-overview/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

Monitor Overview - Selected View: Light Cone Analysis

    [Documentation]     Checking monitor overview: Light cone analysis for selected view

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/profile/global-settings/LIGHT-CONE-ANALYTICS-MONITOR-OVERVIEW-selectedView/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

Global Settings

    [Documentation]     Checking global settings

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/profile/global-settings/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain  ${response_body}                            PORTFOLIO-MANAGEMENT

Global Settings: Portfolio Management

    [Documentation]     Checking portfolio management: Global settings

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             display_options

Calculation: Summary

    [Documentation]     Checking calculations: Summary for currency - CAD
    [Tags]  CAD

    ${payload_summary} =    Set Variable                        {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_summary}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Calculation: Summary USD

    [Documentation]     Checking calculations: Summary for currency - USD
    [Tags]  USD

    ${payload_summary_usd} =    Set Variable                    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"USD","inventory_type":"AGGREGATION"},"options":{"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/summary/     data=${payload_summary_usd}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Calculation: Cumulative Return Trend

    [Documentation]     Checking calculations: Cumulative return trend for currency - CAD
    [Tags]  CAD

    ${payload_cumulative_return} =  Set Variable                {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/trend-cumul-ret/     data=${payload_cumulative_return}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Calculation: Cumulative Return Trend USD

    [Documentation]     Checking calculations: Cumulative return trend for currency - USD
    [Tags]  USD

    ${payload_cumulative_return_usd} =  Set Variable            {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"USD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/trend-cumul-ret/     data=${payload_cumulative_return_usd}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Calculation: PF Deposits

    [Documentation]     Checking calculations: PF deposits for currency - CAD
    [Tags]  CAD

    ${payload_pf_deposits} =    Set Variable        	        {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"single_result":"false","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/pf-deposits/     data=${payload_pf_deposits}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Calculation: PF Deposits USD

    [Documentation]     Checking calculations: PF deposits for currency - USD
    [Tags]  USD

    ${payload_pf_deposits_usd} =    Set Variable     	        {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"USD","inventory_type":"AGGREGATION"},"options":{"single_result":"false","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/pf-deposits/     data=${payload_pf_deposits_usd}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Calculation: PF Activity

    [Documentation]     Checking calculations: PF activity for currency - CAD
    [Tags]  CAD

    ${payload_pf_activity} =    Set Variable                    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":"allocationChanges","drilldown_dimension":"assetClass","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/pf-activity-group1/     data=${payload_pf_activity}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Calculation: PF Activity USD

    [Documentation]     Checking calculations: PF activity for currency - USD
    [Tags]  USD

    ${payload_pf_activity_usd} =    Set Variable                {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"USD","inventory_type":"AGGREGATION"},"options":{"metric":"allocationChanges","drilldown_dimension":"assetClass","date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/pf-activity-group1/     data=${payload_pf_activity_usd}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             categories

Calculation: Trend

    [Documentation]     Checking calculations: Trend for currency - CAD
    [Tags]  CAD

    ${payload_trend} =  Set Variable                            {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/trend-aum/     data=${payload_trend}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Calculation: Trend USD

    [Documentation]     Checking calculations: Trend for currency - USD
    [Tags]  USD

    ${payload_trend_usd} =  set variable                        {"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"USD","inventory_type":"AGGREGATION"},"control":{"filter":{}},"options":{"drilldown_dimension":"topLevel","domain_of_value":"portfolioReference","treatment_of_fx":${TREATMENT_OF_FX},"metric_type":"$","time_series":${TIME_SERIES},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"single_result":"undefined","compare":"undefined"},"benchmarks":null}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/calc/trend-aum/     data=${payload_trend_usd}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Total Portfolio

Views: Light Cone Analysis

    [Documentation]     Checking light cone analysis for views

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    api/v1/profile/views/?table_key=LIGHT-CONE-ANALYTICS-MONITOR-OVERVIEW

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             count



# API calls for Add/Remove filters in 'Monitor - Overview' tab

Manage Global Filters

    [Documentation]     Checking global filter management

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api                    /api/v1/static/filter-criteria/?is_global=1

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Value  ${response_body}           filter-criteria

Add a Global Filter

    [Documentation]     Creating new global filter

    ${add_global_filter} =  Set Variable                        {"type":"global-filter","items":[{"name":"Test Filter","join_operator":"AND","items":[{"id":4147,"role_id":5,"value":"${USER_LAST_NAME}, ${USER_FIRST_NAME}","url":"${BASE_URL}/api/v1/filtercriteria/4147/"}]}]}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                   /api/v1/profile/global-filter/     data=${add_global_filter}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             items

Remove Global Filter
    [Documentation]     Removing global filters

    ${remove_global_filter} =  Set Variable                     {"type":"global-filter","items":[]}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api                    /api/v1/profile/global-filter/     data=${remove_global_filter}    headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             items












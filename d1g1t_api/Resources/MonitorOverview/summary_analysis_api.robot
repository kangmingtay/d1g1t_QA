*** Settings ***

Documentation  Testing API calls for summary analysis chart in Monitor page 'Overview' tab.

Library  RequestsLibrary
Library  Collections


*** Variables ***


*** Keywords ***


# One Month:

One Month - Summary Statistics

    [Documentation]     Checking Summary Statistics for one month range

    ${date_range_value} =               Set Variable    "month"
    ${date_range_label} =               Set Variable    "1 Month"
    ${payload_summary_statistics} =     Set Variable    {"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request     d1g1t_api        /api/v1/profile/global-settings/SUMMARY-STATISTICS-MONITOR-OVERVIEW/      data=${payload_summary_statistics}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             period

One Month - Summary

    [Documentation]     Checking Summary for one month range

    ${date_range_value} =       Set Variable    "month"
    ${date_range_label} =       Set Variable    "1 Month"
    ${payload_summary} =        Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api        /api/v1/calc/summary/      data=${payload_summary}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        value_type


# 3 Months:

3 Months - Summary Statistics

    [Documentation]     Checking Summary Statistics for 3 months range

    ${date_range_value} =               Set Variable    "quarter"
    ${date_range_label} =               Set Variable    "3 Months"
    ${payload_summary_statistics} =     Set Variable    {"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request     d1g1t_api        /api/v1/profile/global-settings/SUMMARY-STATISTICS-MONITOR-OVERVIEW/      data=${payload_summary_statistics}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             period

3 Months - Summary

    [Documentation]     Checking Summary for 3 months range

    ${date_range_value} =       Set Variable    "quarter"
    ${date_range_label} =       Set Variable    "3 Months"
    ${payload_summary} =        Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api        /api/v1/calc/summary/      data=${payload_summary}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        value_type


# 6 Months:

6 Months - Summary Statistics

    [Documentation]     Checking Summary Statistics for 6 months range

    ${date_range_value} =               Set Variable    "6_months"
    ${date_range_label} =               Set Variable    "6 Months"
    ${payload_summary_statistics} =     Set Variable    {"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request     d1g1t_api        /api/v1/profile/global-settings/SUMMARY-STATISTICS-MONITOR-OVERVIEW/      data=${payload_summary_statistics}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             period

6 Months - Summary

    [Documentation]     Checking Summary for 6 months range

    ${date_range_value} =       Set Variable    "6_months"
    ${date_range_label} =       Set Variable    "6 Months"
    ${payload_summary} =        Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api        /api/v1/calc/summary/      data=${payload_summary}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        value_type


# Year-to-Date:

Year to Date - Summary Statistics

    [Documentation]     Checking Summary Statistics for the range year to date

    ${date_range_value} =               Set Variable    "ytd"
    ${date_range_label} =               Set Variable    "Year-to-Date"
    ${payload_summary_statistics} =     Set Variable    {"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request     d1g1t_api        /api/v1/profile/global-settings/SUMMARY-STATISTICS-MONITOR-OVERVIEW/      data=${payload_summary_statistics}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             period

Year to Date - Summary

    [Documentation]     Checking Summary for the range year to date

    ${date_range_value} =       Set Variable    "ytd"
    ${date_range_label} =       Set Variable    "Year-to-Date"
    ${payload_summary} =        Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api        /api/v1/calc/summary/      data=${payload_summary}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        value_type


# 1 Year:

1 Year - Summary Statistics

    [Documentation]     Checking Summary Statistics for 1 year range

    ${payload_summary_statistics} =     Set Variable    {"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request     d1g1t_api        /api/v1/profile/global-settings/SUMMARY-STATISTICS-MONITOR-OVERVIEW/      data=${payload_summary_statistics}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             period

1 Year - Summary

    [Documentation]     Checking Summary for 1 year range

    ${payload_summary} =        Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api        /api/v1/calc/summary/      data=${payload_summary}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        value_type


# 3 Years:

3 Years - Summary Statistics

    [Documentation]     Checking Summary Statistics for 3 years range

    ${date_range_value} =               Set Variable    "3_years"
    ${date_range_label} =               Set Variable    "3 Years"
    ${payload_summary_statistics} =     Set Variable    {"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request     d1g1t_api        /api/v1/profile/global-settings/SUMMARY-STATISTICS-MONITOR-OVERVIEW/      data=${payload_summary_statistics}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             period

3 Years - Summary

    [Documentation]     Checking Summary for 3 years range

    ${date_range_value} =       Set Variable    "3_years"
    ${date_range_label} =       Set Variable    "3 Years"
    ${payload_summary} =        Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api        /api/v1/calc/summary/      data=${payload_summary}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        value_type


# 5 Years:

5 Years - Summary Statistics

    [Documentation]     Checking Summary Statistics for 5 years range

    ${date_range_value} =               Set Variable    "5_years"
    ${date_range_label} =               Set Variable    "5 Years"
    ${payload_summary_statistics} =     Set Variable    {"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request     d1g1t_api        /api/v1/profile/global-settings/SUMMARY-STATISTICS-MONITOR-OVERVIEW/      data=${payload_summary_statistics}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             period

5 Years - Summary

    [Documentation]     Checking Summary for 5 years range

    ${date_range_value} =       Set Variable    "5_years"
    ${date_range_label} =       Set Variable    "5 Years"
    ${payload_summary} =        Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api        /api/v1/calc/summary/      data=${payload_summary}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        value_type


# Since Inception:

Since Inception - Summary Statistics

    [Documentation]     Checking Summary Statistics since inception

    ${date_range_value} =               Set Variable    "since_inception"
    ${date_range_label} =               Set Variable    "Since Inception"
    ${payload_summary_statistics} =     Set Variable    {"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request     d1g1t_api        /api/v1/profile/global-settings/SUMMARY-STATISTICS-MONITOR-OVERVIEW/      data=${payload_summary_statistics}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             period

Since Inception - Summary

    [Documentation]     Checking Summary since inception

    ${date_range_value} =       Set Variable    "since_inception"
    ${date_range_label} =       Set Variable    "Since Inception"
    ${payload_summary} =        Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api        /api/v1/calc/summary/      data=${payload_summary}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Run Keyword If   ${response.status_code}==202   Wait Until Keyword Succeeds   5x   10sec   Should Be Equal As Strings   ${response.status_code}   200   ELSE   Should Be Equal As Strings   ${response.status_code}   200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        value_type














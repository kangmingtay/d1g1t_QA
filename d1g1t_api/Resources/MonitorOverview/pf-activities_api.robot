*** Settings ***

Documentation  Testing API calls for pf activitiy chart in Monitor page 'Overview' tab.

Library  RequestsLibrary
Library  Collections


*** Variables ***


*** Keywords ***

# Asset Class:

    # Allocation Changes

Asset Class: Allocation Changes - Portfolio Management (1 Year)

    [Documentation]     Checking portfolio management under "asset class" for "allocation changes"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocationChanges"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation Changes - PF Activity (1 Year)

    [Documentation]     Checking pf activity under "asset class" for "allocation changes"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocationChanges"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation Changes - Portfolio Management (1 Month)

    [Documentation]     Checking 1 Month portfolio management under "asset class" for "allocation changes"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocationChanges"
    ${date_range_value} =                   Set Variable    "month"
    ${date_range_label} =                   Set Variable    "1 Month"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation Changes - PF Activity (1 Month)

    [Documentation]     Checking 1 Month pf activity under "asset class" for "allocation changes"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocationChanges"
    ${date_range_value} =       Set Variable    "month"
    ${date_range_label} =       Set Variable    "1 Month"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation Changes - Portfolio Management (3 Months)

    [Documentation]     Checking 3 Months portfolio management under "asset class" for "allocation changes"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocationChanges"
    ${date_range_value} =                   Set Variable    "quarter"
    ${date_range_label} =                   Set Variable    "3 Months"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation Changes - PF Activity (3 Months)

    [Documentation]     Checking 3 Months pf activity under "asset class" for "allocation changes"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocationChanges"
    ${date_range_value} =       Set Variable    "quarter"
    ${date_range_label} =       Set Variable    "3 Months"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation Changes - Portfolio Management (6 Months)

    [Documentation]     Checking 6 Months portfolio management under "asset class" for "allocation changes"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocationChanges"
    ${date_range_value} =                   Set Variable    "6_months"
    ${date_range_label} =                   Set Variable    "6 Months"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation Changes - PF Activity (6 Months)

    [Documentation]     Checking 6 Months pf activity under "asset class" for "allocation changes"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocationChanges"
    ${date_range_value} =       Set Variable    "6_months"
    ${date_range_label} =       Set Variable    "6 Months"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation Changes - Portfolio Management (Year-to-Date)

    [Documentation]     Checking Year-to-Date portfolio management under "asset class" for "allocation changes"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocationChanges"
    ${date_range_value} =                   Set Variable    "ytd"
    ${date_range_label} =                   Set Variable    "Year-to-Date"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation Changes - PF Activity (Year-to-Date)

    [Documentation]     Checking Year-to-Date pf activity under "asset class" for "allocation changes"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocationChanges"
    ${date_range_value} =       Set Variable    "ytd"
    ${date_range_label} =       Set Variable    "Year-to-Date"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation Changes - Portfolio Management (3 Years)

    [Documentation]     Checking 3 Years portfolio management under "asset class" for "allocation changes"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocationChanges"
    ${date_range_value} =                   Set Variable    "3_years"
    ${date_range_label} =                   Set Variable    "3 Years"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation Changes - PF Activity (3 Years)

    [Documentation]     Checking 3 Years pf activity under "asset class" for "allocation changes"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocationChanges"
    ${date_range_value} =       Set Variable    "3_years"
    ${date_range_label} =       Set Variable    "3 Years"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation Changes - Portfolio Management (5 Years)

    [Documentation]     Checking 5 Years portfolio management under "asset class" for "allocation changes"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocationChanges"
    ${date_range_value} =                   Set Variable    "5_years"
    ${date_range_label} =                   Set Variable    "5 Years"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation Changes - PF Activity (5 Years)

    [Documentation]     Checking 5 Years pf activity under "asset class" for "allocation changes"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocationChanges"
    ${date_range_value} =       Set Variable    "5_years"
    ${date_range_label} =       Set Variable    "5 Years"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation Changes - Portfolio Management (Since Inception)

    [Documentation]     Checking portfolio management Since Inception under "asset class" for "allocation changes"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocationChanges"
    ${date_range_value} =                   Set Variable    "since_inception"
    ${date_range_label} =                   Set Variable    "Since Inception"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation Changes - PF Activity (Since Inception)

    [Documentation]     Checking pf activity Since Inception under "asset class" for "allocation changes"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocationChanges"
    ${date_range_value} =       Set Variable    "since_inception"
    ${date_range_label} =       Set Variable    "Since Inception"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity


        # Quarterly Allocation Changes

Asset Class: Quarterly Allocation Changes - Portfolio Management (1 Year)

    [Documentation]     Checking portfolio management under "asset class" for quarterly "allocation changes"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocationChanges"
    ${time_series} =                        Set Variable    "quarterly"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Quarterly Allocation Changes - PF Activity (1 Year)

    [Documentation]     Checking pf activity under "asset class" for quarterly "allocation changes"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocationChanges"
    ${time_series} =            Set Variable    "quarterly"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity


    # Allocation

Asset Class: Allocation - Portfolio Management (1 Year)

    [Documentation]     Checking portfolio management under "asset class" for "allocation"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocation"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation - PF Activity (1 Year)

    [Documentation]     Checking pf activity under "asset class" for "allocation"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocation"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation - Portfolio Management (1 Month)

    [Documentation]     Checking 1 Month portfolio management under "asset class" for "allocation"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocation"
    ${date_range_value} =                   Set Variable    "month"
    ${date_range_label} =                   Set Variable    "1 Month"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation - PF Activity (1 Month)

    [Documentation]     Checking 1 Month pf activity under "asset class" for "allocation"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocation"
    ${date_range_value} =       Set Variable    "month"
    ${date_range_label} =       Set Variable    "1 Month"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation - Portfolio Management (3 Months)

    [Documentation]     Checking 3 Months portfolio management under "asset class" for "allocation"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocation"
    ${date_range_value} =                   Set Variable    "quarter"
    ${date_range_label} =                   Set Variable    "3 Months"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation - PF Activity (3 Months)

    [Documentation]     Checking 3 Months pf activity under "asset class" for "allocation"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocation"
    ${date_range_value} =       Set Variable    "quarter"
    ${date_range_label} =       Set Variable    "3 Months"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation - Portfolio Management (6 Months)

    [Documentation]     Checking 6 Months portfolio management under "asset class" for "allocation"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocation"
    ${date_range_value} =                   Set Variable    "6_months"
    ${date_range_label} =                   Set Variable    "6 Months"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation - PF Activity (6 Months)

    [Documentation]     Checking 6 Months pf activity under "asset class" for "allocation"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocation"
    ${date_range_value} =       Set Variable    "6_months"
    ${date_range_label} =       Set Variable    "6 Months"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation - Portfolio Management (Year-to-Date)

    [Documentation]     Checking Year-to-Date portfolio management under "asset class" for "allocation"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocation"
    ${date_range_value} =                   Set Variable    "ytd"
    ${date_range_label} =                   Set Variable    "Year-to-Date"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation - PF Activity (Year-to-Date)

    [Documentation]     Checking Year-to-Date pf activity under "asset class" for "allocation"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocation"
    ${date_range_value} =       Set Variable    "ytd"
    ${date_range_label} =       Set Variable    "Year-to-Date"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation - Portfolio Management (3 Years)

    [Documentation]     Checking 3 Years portfolio management under "asset class" for "allocation"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocation"
    ${date_range_value} =                   Set Variable    "3_years"
    ${date_range_label} =                   Set Variable    "3 Years"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation - PF Activity (3 Years)

    [Documentation]     Checking 3 Years pf activity under "asset class" for "allocation"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocation"
    ${date_range_value} =       Set Variable    "3_years"
    ${date_range_label} =       Set Variable    "3 Years"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation - Portfolio Management (5 Years)

    [Documentation]     Checking 5 Years portfolio management under "asset class" for "allocation"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocation"
    ${date_range_value} =                   Set Variable    "5_years"
    ${date_range_label} =                   Set Variable    "5 Years"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation - PF Activity (5 Years)

    [Documentation]     Checking 5 Years pf activity under "asset class" for "allocation"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocation"
    ${date_range_value} =       Set Variable    "5_years"
    ${date_range_label} =       Set Variable    "5 Years"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity

Asset Class: Allocation - Portfolio Management (Since Inception)

    [Documentation]     Checking portfolio management Since Inception under "asset class" for "allocation"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocation"
    ${date_range_value} =                   Set Variable    "since_inception"
    ${date_range_label} =                   Set Variable    "Since Inception"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Allocation - PF Activity (Since Inception)

    [Documentation]     Checking pf activity Since Inception under "asset class" for "allocation"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocation"
    ${date_range_value} =       Set Variable    "since_inception"
    ${date_range_label} =       Set Variable    "Since Inception"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity


        # Quarterly Allocation

Asset Class: Quarterly Allocation - Portfolio Management (1 Year)

    [Documentation]     Checking portfolio management under "asset class" for quarterly "allocation"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "allocation"
    ${time_series} =                        Set Variable    "quarterly"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Asset Class: Quarterly Allocation - PF Activity (1 Year)

    [Documentation]     Checking pf activity under "asset class" for quarterly "allocation"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "allocation"
    ${time_series} =            Set Variable    "quarterly"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Equity


# Account type:

    # Net Deposits/Withdrawals

Account type: Net Deposits/Withdrawals - Portfolio Management (1 Year)

    [Documentation]     Checking portfolio management under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "inflowsOutflows"
    ${payload_portfolio_management} =       Set Variable    {"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"metric":${metric},"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_step":${TIME_SERIES},"drilldown_dimension":${drilldown_dimension},"display_options":{"display_data":{"show_current_data_only":false}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Account type: Net Deposits/Withdrawals - PF Activity (1 Year)

    [Documentation]     Checking pf activity under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "inflowsOutflows"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_series":${TIME_SERIES},"single_result":"false","drilldown_dimension":${drilldown_dimension}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Net Deposits

Account type: Net Deposits/Withdrawals - Portfolio Management (1 Month)

    [Documentation]     Checking 1 Month portfolio management under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "inflowsOutflows"
    ${date_range_value} =                   Set Variable    "month"
    ${date_range_label} =                   Set Variable    "1 Month"
    ${payload_portfolio_management} =       Set Variable    {"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"metric":${metric},"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_step":${TIME_SERIES},"drilldown_dimension":${drilldown_dimension},"display_options":{"display_data":{"show_current_data_only":false}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Account type: Net Deposits/Withdrawals - PF Activity (1 Month)

    [Documentation]     Checking 1 Month pf activity under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "inflowsOutflows"
    ${date_range_value} =       Set Variable    "month"
    ${date_range_label} =       Set Variable    "1 Month"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_series":${TIME_SERIES},"single_result":"false","drilldown_dimension":${drilldown_dimension}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Net Deposits

Account type: Net Deposits/Withdrawals - Portfolio Management (3 Months)

    [Documentation]     Checking 3 Months portfolio management under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "inflowsOutflows"
    ${date_range_value} =                   Set Variable    "quarter"
    ${date_range_label} =                   Set Variable    "3 Months"
    ${payload_portfolio_management} =       Set Variable    {"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"metric":${metric},"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_step":${TIME_SERIES},"drilldown_dimension":${drilldown_dimension},"display_options":{"display_data":{"show_current_data_only":false}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Account type: Net Deposits/Withdrawals - PF Activity (3 Months)

    [Documentation]     Checking 3 Months pf activity under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "inflowsOutflows"
    ${date_range_value} =       Set Variable    "quarter"
    ${date_range_label} =       Set Variable    "3 Months"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_series":${TIME_SERIES},"single_result":"false","drilldown_dimension":${drilldown_dimension}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Net Deposits

Account type: Net Deposits/Withdrawals - Portfolio Management (6 Months)

    [Documentation]     Checking 6 Months portfolio management under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "inflowsOutflows"
    ${date_range_value} =                   Set Variable    "6_months"
    ${date_range_label} =                   Set Variable    "6 Months"
    ${payload_portfolio_management} =       Set Variable    {"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"metric":${metric},"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_step":${TIME_SERIES},"drilldown_dimension":${drilldown_dimension},"display_options":{"display_data":{"show_current_data_only":false}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Account type: Net Deposits/Withdrawals - PF Activity (6 Months)

    [Documentation]     Checking 6 Months pf activity under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "inflowsOutflows"
    ${date_range_value} =       Set Variable    "6_months"
    ${date_range_label} =       Set Variable    "6 Months"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_series":${TIME_SERIES},"single_result":"false","drilldown_dimension":${drilldown_dimension}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Net Deposits

Account type: Net Deposits/Withdrawals - Portfolio Management (Year-to-Date)

    [Documentation]     Checking Year-to-Date portfolio management under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "inflowsOutflows"
    ${date_range_value} =                   Set Variable    "ytd"
    ${date_range_label} =                   Set Variable    "Year-to-Date"
    ${payload_portfolio_management} =       Set Variable    {"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"metric":${metric},"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_step":${TIME_SERIES},"drilldown_dimension":${drilldown_dimension},"display_options":{"display_data":{"show_current_data_only":false}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Account type: Net Deposits/Withdrawals - PF Activity (Year-to-Date)

    [Documentation]     Checking Year-to-Date pf activity under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "inflowsOutflows"
    ${date_range_value} =       Set Variable    "ytd"
    ${date_range_label} =       Set Variable    "Year-to-Date"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_series":${TIME_SERIES},"single_result":"false","drilldown_dimension":${drilldown_dimension}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Net Deposits

Account type: Net Deposits/Withdrawals - Portfolio Management (3 Years)

    [Documentation]     Checking 3 Years portfolio management under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "inflowsOutflows"
    ${date_range_value} =                   Set Variable    "3_years"
    ${date_range_label} =                   Set Variable    "3 Years"
    ${payload_portfolio_management} =       Set Variable    {"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"metric":${metric},"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_step":${TIME_SERIES},"drilldown_dimension":${drilldown_dimension},"display_options":{"display_data":{"show_current_data_only":false}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Account type: Net Deposits/Withdrawals - PF Activity (3 Years)

    [Documentation]     Checking 3 Years pf activity under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "inflowsOutflows"
    ${date_range_value} =       Set Variable    "3_years"
    ${date_range_label} =       Set Variable    "3 Years"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_series":${TIME_SERIES},"single_result":"false","drilldown_dimension":${drilldown_dimension}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Net Deposits

Account type: Net Deposits/Withdrawals - Portfolio Management (5 Years)

    [Documentation]     Checking 5 Years portfolio management under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "inflowsOutflows"
    ${date_range_value} =                   Set Variable    "5_years"
    ${date_range_label} =                   Set Variable    "5 Years"
    ${payload_portfolio_management} =       Set Variable    {"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"metric":${metric},"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_step":${TIME_SERIES},"drilldown_dimension":${drilldown_dimension},"display_options":{"display_data":{"show_current_data_only":false}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Account type: Net Deposits/Withdrawals - PF Activity (5 Years)

    [Documentation]     Checking 5 Years pf activity under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "inflowsOutflows"
    ${date_range_value} =       Set Variable    "5_years"
    ${date_range_label} =       Set Variable    "5 Years"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_series":${TIME_SERIES},"single_result":"false","drilldown_dimension":${drilldown_dimension}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Net Deposits

Account type: Net Deposits/Withdrawals - Portfolio Management (Since Inception)

    [Documentation]     Checking portfolio management Since Inception under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "inflowsOutflows"
    ${date_range_value} =                   Set Variable    "since_inception"
    ${date_range_label} =                   Set Variable    "Since Inception"
    ${payload_portfolio_management} =       Set Variable    {"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"metric":${metric},"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_step":${TIME_SERIES},"drilldown_dimension":${drilldown_dimension},"display_options":{"display_data":{"show_current_data_only":false}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Account type: Net Deposits/Withdrawals - PF Activity (Since Inception)

    [Documentation]     Checking pf activity Since Inception under "Account type" for "Net Deposits/Withdrawals"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "inflowsOutflows"
    ${date_range_value} =       Set Variable    "since_inception"
    ${date_range_label} =       Set Variable    "Since Inception"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_series":${TIME_SERIES},"single_result":"false","drilldown_dimension":${drilldown_dimension}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Net Deposits


        # Quarterly Net Deposits/Withdrawals

Account type: Quarterly Net Deposits/Withdrawals - Portfolio Management (1 Year)

    [Documentation]     Checking portfolio management under "Account type" for quarterly "Net Deposits/Withdrawals"

    ${drilldown_dimension} =                Set Variable    "assetClass"
    ${metric} =                             Set Variable    "inflowsOutflows"
    ${time_series} =                        Set Variable    "quarterly"
    ${payload_portfolio_management} =       Set Variable    {"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"metric":${metric},"period":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_step":${TIME_SERIES},"drilldown_dimension":${drilldown_dimension},"display_options":{"display_data":{"show_current_data_only":false}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Account type: Quarterly Net Deposits/Withdrawals - PF Activity (1 Year)

    [Documentation]     Checking pf activity under "Account type" for quarterly "Net Deposits/Withdrawals"

    ${drilldown_dimension} =    Set Variable    "assetClass"
    ${metric} =                 Set Variable    "inflowsOutflows"
    ${time_series} =            Set Variable    "quarterly"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"time_series":${TIME_SERIES},"single_result":"false","drilldown_dimension":${drilldown_dimension}}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Net Deposits


    # Deposits

#Account type: Deposits - Portfolio Management (1 Year)
#
#    [Documentation]     Checking portfolio management under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "inflows"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period

#Account type: Deposits - PF Activity (1 Year)
#
#    [Documentation]     Checking pf activity under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "inflows"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Deposits - Portfolio Management (1 Month)
#
#    [Documentation]     Checking 1 Month portfolio management under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "inflows"
#    ${date_range_value} =                   Set Variable    "month"
#    ${date_range_label} =                   Set Variable    "1 Month"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Deposits - PF Activity (1 Month)
#
#    [Documentation]     Checking 1 Month pf activity under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "inflows"
#    ${date_range_value} =       Set Variable    "month"
#    ${date_range_label} =       Set Variable    "1 Month"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Deposits - Portfolio Management (3 Months)
#
#    [Documentation]     Checking 3 Months portfolio management under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "inflows"
#    ${date_range_value} =                   Set Variable    "quarter"
#    ${date_range_label} =                   Set Variable    "3 Months"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Deposits - PF Activity (3 Months)
#
#    [Documentation]     Checking 3 Months pf activity under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "inflows"
#    ${date_range_value} =       Set Variable    "quarter"
#    ${date_range_label} =       Set Variable    "3 Months"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Deposits - Portfolio Management (6 Months)
#
#    [Documentation]     Checking 6 Months portfolio management under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "inflows"
#    ${date_range_value} =                   Set Variable    "6_months"
#    ${date_range_label} =                   Set Variable    "6 Months"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Deposits - PF Activity (6 Months)
#
#    [Documentation]     Checking 6 Months pf activity under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "inflows"
#    ${date_range_value} =       Set Variable    "6_months"
#    ${date_range_label} =       Set Variable    "6 Months"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Deposits - Portfolio Management (Year-to-Date)
#
#    [Documentation]     Checking Year-to-Date portfolio management under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "inflows"
#    ${date_range_value} =                   Set Variable    "ytd"
#    ${date_range_label} =                   Set Variable    "Year-to-Date"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Deposits - PF Activity (Year-to-Date)
#
#    [Documentation]     Checking Year-to-Date pf activity under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "inflows"
#    ${date_range_value} =       Set Variable    "ytd"
#    ${date_range_label} =       Set Variable    "Year-to-Date"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Deposits - Portfolio Management (3 Years)
#
#    [Documentation]     Checking 3 Years portfolio management under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "inflows"
#    ${date_range_value} =                   Set Variable    "3_years"
#    ${date_range_label} =                   Set Variable    "3 Years"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Deposits - PF Activity (3 Years)
#
#    [Documentation]     Checking 3 Years pf activity under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "inflows"
#    ${date_range_value} =       Set Variable    "3_years"
#    ${date_range_label} =       Set Variable    "3 Years"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Deposits - Portfolio Management (5 Years)
#
#    [Documentation]     Checking 5 Years portfolio management under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "inflows"
#    ${date_range_value} =                   Set Variable    "5_years"
#    ${date_range_label} =                   Set Variable    "5 Years"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Deposits - PF Activity (5 Years)
#
#    [Documentation]     Checking 5 Years pf activity under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "inflows"
#    ${date_range_value} =       Set Variable    "5_years"
#    ${date_range_label} =       Set Variable    "5 Years"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Deposits - Portfolio Management (Since Inception)
#
#    [Documentation]     Checking portfolio management Since Inception under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "inflows"
#    ${date_range_value} =                   Set Variable    "since_inception"
#    ${date_range_label} =                   Set Variable    "Since Inception"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Deposits - PF Activity (Since Inception)
#
#    [Documentation]     Checking pf activity Since Inception under "Account type" for "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "inflows"
#    ${date_range_value} =       Set Variable    "since_inception"
#    ${date_range_label} =       Set Variable    "Since Inception"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#
#        # Quarterly Deposits
#
#Account type: Quarterly Deposits - Portfolio Management (1 Year)
#
#    [Documentation]     Checking portfolio management under "Account type" for quarterly "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "inflows"
#    ${time_series} =                        Set Variable    "quarterly"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Quarterly Deposits - PF Activity (1 Year)
#
#    [Documentation]     Checking pf activity under "Account type" for quarterly "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "inflows"
#    ${time_series} =            Set Variable    "quarterly"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#
#   # Withdrawals
#
#Account type: Withdrawals - Portfolio Management (1 Year)
#
#    [Documentation]     Checking portfolio management under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "outflows"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Withdrawals - PF Activity (1 Year)
#
#    [Documentation]     Checking pf activity under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "outflows"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Withdrawals - Portfolio Management (3 Months)
#
#    [Documentation]     Checking 3 Months portfolio management under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "outflows"
#    ${date_range_value} =                   Set Variable    "quarter"
#    ${date_range_label} =                   Set Variable    "3 Months"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Withdrawals - PF Activity (3 Months)
#
#    [Documentation]     Checking 3 Months pf activity under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "outflows"
#    ${date_range_value} =       Set Variable    "quarter"
#    ${date_range_label} =       Set Variable    "3 Months"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Withdrawals - Portfolio Management (6 Months)
#
#    [Documentation]     Checking 6 Months portfolio management under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "outflows"
#    ${date_range_value} =                   Set Variable    "6_months"
#    ${date_range_label} =                   Set Variable    "6 Months"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Withdrawals - PF Activity (6 Months)
#
#    [Documentation]     Checking 6 Months pf activity under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "outflows"
#    ${date_range_value} =       Set Variable    "6_months"
#    ${date_range_label} =       Set Variable    "6 Months"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Withdrawals - Portfolio Management (Year-to-Date)
#
#    [Documentation]     Checking Year-to-Date portfolio management under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "outflows"
#    ${date_range_value} =                   Set Variable    "ytd"
#    ${date_range_label} =                   Set Variable    "Year-to-Date"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Withdrawals - PF Activity (Year-to-Date)
#
#    [Documentation]     Checking Year-to-Date pf activity under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "outflows"
#    ${date_range_value} =       Set Variable    "ytd"
#    ${date_range_label} =       Set Variable    "Year-to-Date"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Withdrawals - Portfolio Management (3 Years)
#
#    [Documentation]     Checking 3 Years portfolio management under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "outflows"
#    ${date_range_value} =                   Set Variable    "3_years"
#    ${date_range_label} =                   Set Variable    "3 Years"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Withdrawals - PF Activity (3 Years)
#
#    [Documentation]     Checking 3 Years pf activity under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "outflows"
#    ${date_range_value} =       Set Variable    "3_years"
#    ${date_range_label} =       Set Variable    "3 Years"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Withdrawals - Portfolio Management (5 Years)
#
#    [Documentation]     Checking 5 Years portfolio management under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "outflows"
#    ${date_range_value} =                   Set Variable    "5_years"
#    ${date_range_label} =                   Set Variable    "5 Years"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Withdrawals - PF Activity (5 Years)
#
#    [Documentation]     Checking 5 Years pf activity under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "outflows"
#    ${date_range_value} =       Set Variable    "5_years"
#    ${date_range_label} =       Set Variable    "5 Years"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#Account type: Withdrawals - Portfolio Management (Since Inception)
#
#    [Documentation]     Checking portfolio management Since Inception under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "outflows"
#    ${date_range_value} =                   Set Variable    "since_inception"
#    ${date_range_label} =                   Set Variable    "Since Inception"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Withdrawals - PF Activity (Since Inception)
#
#    [Documentation]     Checking pf activity Since Inception under "Account type" for "Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "outflows"
#    ${date_range_value} =       Set Variable    "since_inception"
#    ${date_range_label} =       Set Variable    "Since Inception"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP
#
#
#        # Quarterly Withdrawals
#
#Account type: Quarterly Withdrawals - Portfolio Management (1 Year)
#
#    [Documentation]     Checking portfolio management under "Account type" for quarterly "Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "accountType"
#    ${metric} =                             Set Variable    "outflows"
#    ${time_series} =                        Set Variable    "quarterly"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Account type: Quarterly Withdrawals - PF Activity (1 Year)
#
#    [Documentation]     Checking pf activity under "Account type" for quarterly "Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "accountType"
#    ${metric} =                 Set Variable    "outflows"
#    ${time_series} =            Set Variable    "quarterly"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        RRSP



# Currency:

    # Allocation Changes

Currency: Allocation Changes - Portfolio Management (1 Year)

    [Documentation]     Checking portfolio management under "currency" for "allocation changes"

    ${drilldown_dimension} =                Set Variable    "currency"
    ${metric} =                             Set Variable    "allocationChanges"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Currency: Allocation Changes - PF Activity (1 Year)

    [Documentation]     Checking pf activity under "currency" for "allocation changes"

    ${drilldown_dimension} =    Set Variable    "currency"
    ${metric} =                 Set Variable    "allocationChanges"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        CAD


    # Allocation

Currency: Allocation - Portfolio Management (1 Year)

    [Documentation]     Checking portfolio management under "currency" for "allocation"

    ${drilldown_dimension} =                Set Variable    "currency"
    ${metric} =                             Set Variable    "allocation"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Currency: Allocation - PF Activity (1 Year)

    [Documentation]     Checking pf activity under "currency" for "allocation"

    ${drilldown_dimension} =    Set Variable    "currency"
    ${metric} =                 Set Variable    "allocation"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        CAD



# Strategy:

    # Allocation Changes

Strategy: Allocation Changes - Portfolio Management (1 Year)

    [Documentation]     Checking portfolio management under "strategy" for "allocation changes"

    ${drilldown_dimension} =                Set Variable    "strategy"
    ${metric} =                             Set Variable    "allocationChanges"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Strategy: Allocation Changes - PF Activity (1 Year)

    [Documentation]     Checking pf activity under "strategy" for "allocation changes"

    ${drilldown_dimension} =    Set Variable    "strategy"
    ${metric} =                 Set Variable    "allocationChanges"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Allocation

Strategy: Allocation - Portfolio Management (1 Year)

    [Documentation]     Checking portfolio management under "strategy" for "allocation"

    ${drilldown_dimension} =                Set Variable    "strategy"
    ${metric} =                             Set Variable    "allocation"
    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}

    # Make the call (and capture the response in a variable)
    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.json()}
    Dictionary Should Contain Key  ${response_body}             summary_period

Strategy: Allocation - PF Activity (1 Year)

    [Documentation]     Checking pf activity under "strategy" for "allocation"

    ${drilldown_dimension} =    Set Variable    "strategy"
    ${metric} =                 Set Variable    "allocation"
    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Cash & Cash Equivalent


    # Net Deposits/Withdrawals

#Strategy: Net Deposits/Withdrawals - Portfolio Management (1 Year)
#
#    [Documentation]     Checking portfolio management under "Strategy" for "Net Deposits/Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "strategy"
#    ${metric} =                             Set Variable    "inflowsOutflows"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Strategy: Net Deposits/Withdrawals - PF Activity (1 Year)
#
#    [Documentation]     Checking pf activity under "Strategy" for "Net Deposits/Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "strategy"
#    ${metric} =                 Set Variable    "inflowsOutflows"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        Net Deposits
#
#
#    # Deposits
#
#Strategy: Deposits - Portfolio Management (1 Year)
#
#    [Documentation]     Checking portfolio management under "Strategy" for "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "strategy"
#    ${metric} =                             Set Variable    "inflows"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Strategy: Deposits - PF Activity (1 Year)
#
#    [Documentation]     Checking pf activity under "Strategy" for "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "strategy"
#    ${metric} =                 Set Variable    "inflows"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        Cash & Cash Equivalent
#
#
#   # Withdrawals
#
#Strategy: Withdrawals - Portfolio Management (1 Year)
#
#    [Documentation]     Checking portfolio management under "Strategy" for "Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "strategy"
#    ${metric} =                             Set Variable    "outflows"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Strategy: Withdrawals - PF Activity (1 Year)
#
#    [Documentation]     Checking pf activity under "Strategy" for "Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "strategy"
#    ${metric} =                 Set Variable    "outflows"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        Cash & Cash Equivalent
#
#
#
## Mandate:
#
#    # Net Deposits/Withdrawals
#
#Mandate: Net Deposits/Withdrawals - Portfolio Management (1 Year)
#
#    [Documentation]     Checking portfolio management under "Mandate" for "Net Deposits/Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "mandate"
#    ${metric} =                             Set Variable    "inflowsOutflows"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Mandate: Net Deposits/Withdrawals - PF Activity (1 Year)
#
#    [Documentation]     Checking pf activity under "Mandate" for "Net Deposits/Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "mandate"
#    ${metric} =                 Set Variable    "inflowsOutflows"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        Net Deposits
#
#
#    # Deposits
#
#Mandate: Deposits - Portfolio Management (1 Year)
#
#    [Documentation]     Checking portfolio management under "Mandate" for "Deposits"
#
#    ${drilldown_dimension} =                Set Variable    "mandate"
#    ${metric} =                             Set Variable    "inflows"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Mandate: Deposits - PF Activity (1 Year)
#
#    [Documentation]     Checking pf activity under "Mandate" for "Deposits"
#
#    ${drilldown_dimension} =    Set Variable    "mandate"
#    ${metric} =                 Set Variable    "inflows"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        Dean's Growth Mandate
#
#
#   # Withdrawals
#
#Mandate: Withdrawals - Portfolio Management (1 Year)
#
#    [Documentation]     Checking portfolio management under "Mandate" for "Withdrawals"
#
#    ${drilldown_dimension} =                Set Variable    "mandate"
#    ${metric} =                             Set Variable    "outflows"
#    ${payload_portfolio_management} =       Set Variable    {"metric":${metric},"period":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_step":${TIME_SERIES},"summary_view":"net","summary_period":{"label":"1 Year","value":"year"},"display_options":{"display_data":{"show_current_data_only":false}},"drilldown_dimension":${drilldown_dimension}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Put Request    d1g1t_api        /api/v1/profile/global-settings/PORTFOLIO-MANAGEMENT/      data=${payload_portfolio_management}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.json()}
#    Dictionary Should Contain Key  ${response_body}             summary_period
#
#Mandate: Withdrawals - PF Activity (1 Year)
#
#    [Documentation]     Checking pf activity under "Mandate" for "Withdrawals"
#
#    ${drilldown_dimension} =    Set Variable    "mandate"
#    ${metric} =                 Set Variable    "outflows"
#    ${payload_pf_activity} =    Set Variable    {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"metric":${metric},"drilldown_dimension":${drilldown_dimension},"date_range":{"label":${DATE_RANGE_LABEL},"value":${DATE_RANGE_VALUE}},"time_series":${TIME_SERIES},"single_result":"false"}}
#
#    # Make the call (and capture the response in a variable)
#    ${response} =   Post Request    d1g1t_api   /api/v1/calc/pf-activity-group1/      data=${payload_pf_activity}     headers=&{CONTENT_TYPE}
#
#    # Check the Response status
#    Should Be Equal As Strings  ${response.status_code}         200
#
#    # Check the Response body
#    ${response_body} =  Set Variable  ${response.text}
#    Should Contain      ${response_body}                        Dean's Growth Mandate








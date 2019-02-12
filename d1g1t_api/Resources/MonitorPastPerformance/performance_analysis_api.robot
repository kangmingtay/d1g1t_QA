*** Settings ***

Documentation  Testing API calls for performance analysis chart in Monitor page 'Past Performance' tab.

Library  RequestsLibrary
Library  Collections

*** Variables ***


*** Keywords ***


# Grouping criteria - Household Name:

    # Performance Range

Household Name - Performance Range

    [Documentation]     Checking Performance Range for Household Name

    ${payload_performance_analysis} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"group":"${BASE_URL}/api/v1/grouping-criteria/1/","metric":"return"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/performance-range/     data=${payload_performance_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        stats


# Grouping criteria - Client Name:

    # Performance Range

Client Name - Performance Range

    [Documentation]     Checking Performance Range for Client Name

    ${payload_performance_analysis} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"group":"${BASE_URL}/api/v1/grouping-criteria/2/","metric":"return"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/performance-range/     data=${payload_performance_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        stats


# Grouping criteria - Security Asset Class:

    # Performance Range

Security Asset Class - Performance Range

    [Documentation]     Checking Performance Range for Security Asset Class

    ${payload_performance_analysis} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"group":"${BASE_URL}/api/v1/grouping-criteria/14/","metric":"return"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/performance-range/     data=${payload_performance_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        stats


# Grouping criteria - Security Name:

    # Performance Range

Security Name - Performance Range

    [Documentation]     Checking Performance Range for Security Name

    ${payload_performance_analysis} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"group":"${BASE_URL}/api/v1/grouping-criteria/15/","metric":"return"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/performance-range/     data=${payload_performance_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        stats


# Grouping criteria - Security Strategy:

    # Performance Range

Security Strategy - Performance Range

    [Documentation]     Checking Performance Range for Security Strategy

    ${payload_performance_analysis} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"group":"${BASE_URL}/api/v1/grouping-criteria/20/","metric":"return"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/performance-range/     data=${payload_performance_analysis}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        stats


# Grouping criteria - Household:

   # Top Performers

Household - Global Settings

    [Documentation]     Checking Global Settings for Household

    # Make the call (and capture the response in a variable)
    ${response} =   Get Request    d1g1t_api   /api/v1/profile/global-settings/

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        monitor-activity-selectedView

Household - Top Performers

    [Documentation]     Checking Top Performers for Household

    ${mover_entity_type} =               Set Variable      "Household"
    ${mover_type} =                      Set Variable      "top10"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Household - Top Performers (3 Years)

    [Documentation]     Checking 3 Years Top Performers for Household

    ${mover_entity_type} =               Set Variable      "Household"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "3 Years"
    ${date_range_value} =                Set Variable      "3_years"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Household - Top Performers (5 Years)

    [Documentation]     Checking 5 Years Top Performers for Household

    ${mover_entity_type} =               Set Variable      "Household"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "5 Years"
    ${date_range_value} =                Set Variable      "5_years"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Household - Top Performers (Year-to-Date)

    [Documentation]     Checking Year-to-Date Top Performers for Household

    ${mover_entity_type} =               Set Variable      "Household"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "Year-to-Date"
    ${date_range_value} =                Set Variable      "ytd"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Household - Top Performers (Since Inception)

    [Documentation]     Checking Top Performers Since Inception for Household

    ${mover_entity_type} =               Set Variable      "Household"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "Since Inception"
    ${date_range_value} =                Set Variable      "since_inception"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

   # Bottom Performers

Household - Bottom Performers

    [Documentation]     Checking Bottom Performers for Household

    ${mover_entity_type} =                  Set Variable      "Household"
    ${mover_type} =                         Set Variable      "bottom10"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Household - Bottom Performers (3 Years)

    [Documentation]     Checking 3 Years Bottom Performers for Household

    ${mover_entity_type} =                  Set Variable      "Household"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "3 Years"
    ${date_range_value} =                   Set Variable      "3_years"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Household - Bottom Performers (5 Years)

    [Documentation]     Checking 5 Years Bottom Performers for Household

    ${mover_entity_type} =                  Set Variable      "Household"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "5 Years"
    ${date_range_value} =                   Set Variable      "5_years"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Household - Bottom Performers (Year-to-Date)

    [Documentation]     Checking Year-to-Date Bottom Performers for Household

    ${mover_entity_type} =                  Set Variable      "Household"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "Year-to-Date"
    ${date_range_value} =                   Set Variable      "ytd"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Household - Bottom Performers (Since Inception)

    [Documentation]     Checking Bottom Performers Since Inception for Household

    ${mover_entity_type} =                  Set Variable      "Household"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "Since Inception"
    ${date_range_value} =                   Set Variable      "since_inception"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID


# Grouping criteria - Client:

  # Top Performers

Client - Top Performers

    [Documentation]     Checking Top Performers for Client

    ${mover_entity_type} =               Set Variable      "Client"
    ${mover_type} =                      Set Variable      "top10"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Client - Top Performers (3 Years)

    [Documentation]     Checking 3 Years Top Performers for Client

    ${mover_entity_type} =               Set Variable      "Client"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "3 Years"
    ${date_range_value} =                Set Variable      "3_years"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Client - Top Performers (5 Years)

    [Documentation]     Checking 5 Years Top Performers for Client

    ${mover_entity_type} =               Set Variable      "Client"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "5 Years"
    ${date_range_value} =                Set Variable      "5_years"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Client - Top Performers (Year-to-Date)

    [Documentation]     Checking Year-to-Date Top Performers for Client

    ${mover_entity_type} =               Set Variable      "Client"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "Year-to-Date"
    ${date_range_value} =                Set Variable      "ytd"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Client - Top Performers (Since Inception)

    [Documentation]     Checking Top Performers Since Inception for Client

    ${mover_entity_type} =               Set Variable      "Client"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "Since Inception"
    ${date_range_value} =                Set Variable      "since_inception"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

   # Bottom Performers

Client - Bottom Performers

    [Documentation]     Checking Bottom Performers for Client

    ${mover_entity_type} =                  Set Variable      "Client"
    ${mover_type} =                         Set Variable      "bottom10"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Client - Bottom Performers (3 Years)

    [Documentation]     Checking 3 Years Bottom Performers for Client

    ${mover_entity_type} =                  Set Variable      "Client"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "3 Years"
    ${date_range_value} =                   Set Variable      "3_years"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Client - Bottom Performers (5 Years)

    [Documentation]     Checking 5 Years Bottom Performers for Client

    ${mover_entity_type} =                  Set Variable      "Client"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "5 Years"
    ${date_range_value} =                   Set Variable      "5_years"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Client - Bottom Performers (Year-to-Date)

    [Documentation]     Checking Year-to-Date Bottom Performers for Client

    ${mover_entity_type} =                  Set Variable      "Client"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "Year-to-Date"
    ${date_range_value} =                   Set Variable      "ytd"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Client - Bottom Performers (Since Inception)

    [Documentation]     Checking Bottom Performers Since Inception for Client

    ${mover_entity_type} =                  Set Variable      "Client"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "Since Inception"
    ${date_range_value} =                   Set Variable      "since_inception"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID


# Grouping criteria - Security:

  # Top Performers

Security - Top Performers

    [Documentation]     Checking Top Performers for Security

    ${mover_entity_type} =               Set Variable      "Security"
    ${mover_type} =                      Set Variable      "top10"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Security - Top Performers (3 Years)

    [Documentation]     Checking 3 Years Top Performers for Security

    ${mover_entity_type} =               Set Variable      "Security"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "3 Years"
    ${date_range_value} =                Set Variable      "3_years"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Security - Top Performers (5 Years)

    [Documentation]     Checking 5 Years Top Performers for Security

    ${mover_entity_type} =               Set Variable      "Security"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "5 Years"
    ${date_range_value} =                Set Variable      "5_years"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Security - Top Performers (Year-to-Date)

    [Documentation]     Checking Year-to-Date Top Performers for Security

    ${mover_entity_type} =               Set Variable      "Security"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "Year-to-Date"
    ${date_range_value} =                Set Variable      "ytd"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Security - Top Performers (Since Inception)

    [Documentation]     Checking Top Performers Since Inception for Security

    ${mover_entity_type} =               Set Variable      "Security"
    ${mover_type} =                      Set Variable      "top10"
    ${date_range_label} =                Set Variable      "Since Inception"
    ${date_range_value} =                Set Variable      "since_inception"
    ${payload_top_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_top_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

   # Bottom Performers

Security - Bottom Performers

    [Documentation]     Checking Bottom Performers for Security

    ${mover_entity_type} =                  Set Variable      "Security"
    ${mover_type} =                         Set Variable      "bottom10"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Security - Bottom Performers (3 Years)

    [Documentation]     Checking 3 Years Bottom Performers for Security

    ${mover_entity_type} =                  Set Variable      "Security"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "3 Years"
    ${date_range_value} =                   Set Variable      "3_years"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Security - Bottom Performers (5 Years)

    [Documentation]     Checking 5 Years Bottom Performers for Security

    ${mover_entity_type} =                  Set Variable      "Security"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "5 Years"
    ${date_range_value} =                   Set Variable      "5_years"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Security - Bottom Performers (Year-to-Date)

    [Documentation]     Checking Year-to-Date Bottom Performers for Security

    ${mover_entity_type} =                  Set Variable      "Security"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "Year-to-Date"
    ${date_range_value} =                   Set Variable      "ytd"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID

Security - Bottom Performers (Since Inception)

    [Documentation]     Checking Bottom Performers Since Inception for Security

    ${mover_entity_type} =                  Set Variable      "Security"
    ${mover_type} =                         Set Variable      "bottom10"
    ${date_range_label} =                   Set Variable      "Since Inception"
    ${date_range_value} =                   Set Variable      "since_inception"
    ${payload_bottom_performers} =          Set Variable      {"control":{"filter":{}},"settings":{"date":{"value":${DATE_TYPE},"label":${DATE_LABEL},"date":${DATE_VALUE}},"currency":"CAD","inventory_type":"AGGREGATION"},"options":{"mover_type":${mover_type},"mover_entity_type":${mover_entity_type},"date_range":{"value":${DATE_RANGE_VALUE},"label":${DATE_RANGE_LABEL}},"view_type":"past","single_result":"false"}}

    # Make the call (and capture the response in a variable)
    ${response} =   Post Request    d1g1t_api   /api/v1/calc/top-bottom-performers/     data=${payload_bottom_performers}     headers=&{CONTENT_TYPE}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}         200

    # Check the Response body
    ${response_body} =  Set Variable  ${response.text}
    Should Contain      ${response_body}                        Model ID




























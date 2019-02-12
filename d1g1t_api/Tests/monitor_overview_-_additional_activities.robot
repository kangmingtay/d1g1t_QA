*** Settings ***

Documentation  Testing API calls in Monitor page.

Resource  ../Resources/MonitorOverview/initial_api.robot
Resource  ../Resources/MonitorOverview/date_filters_api.robot
Resource  ../Resources/MonitorOverview/trend_analysis_api.robot
Resource  ../Resources/MonitorOverview/summary_analysis_api.robot
Resource  ../Resources/MonitorOverview/pf-activities_api.robot
Resource  ../Resources/MonitorOverview/past_performance_present_exposure_api.robot

Suite Teardown  Delete All Sessions


*** Variables ***


*** Test Cases ***


# Create a new session

New Session

    [Documentation]  Creating a new user session
    [Tags]  login

    Verify User Login



# API calls for Global Filter Management

Check global filter management

    [Tags]  changing_filters     global_filter

    Manage Global Filters

Check global filter addition

    [Tags]  changing_filters     global_filter

    Add a Global Filter

Check global filter removal

    [Tags]  changing_filters     global_filter

    Remove Global Filter



# API calls for Date Filter Activities

Check calculations for date filter: Today

    [Documentation]  Checking calculations for date filter: Today
    [Tags]   calc                 date_filter

    Date Filter: Today - Summary Calculations
    Date Filter: Today - Cumulative Return Calculations
    Date Filter: Today - PF Deposits Calculations
    Date Filter: Today - PF Activity Group 1 Calculations

Check calculations for date filter: Previous business day

    [Documentation]  Checking calculations for date filter: Previous business day
    [Tags]   calc                 date_filter

    Date Filter: Previous Business day - Summary Calculations
    Date Filter: Previous Business day - Cumulative Return Calculations
    Date Filter: Previous Business day - PF Deposits Calculations
    Date Filter: Previous Business day - PF Activity Group 1 Calculations

Check calculations for date filter: End of previous week

    [Documentation]  Checking calculations for date filter: End of previous week
    [Tags]   calc                 date_filter

    Date Filter: End of previous week - Summary Calculations
    Date Filter: End of previous week - Cumulative Return Calculations
    Date Filter: End of previous week - PF Deposits Calculations
    Date Filter: End of previous week - PF Activity Group 1 Calculations

Check calculations for date filter: End of previous month

    [Documentation]  Checking calculations for date filter: End of previous month
    [Tags]   calc                 date_filter

    Date Filter: End of previous month - Summary Calculations
    Date Filter: End of previous month - Cumulative Return Calculations
    Date Filter: End of previous month - PF Deposits Calculations
    Date Filter: End of previous month - PF Activity Group 1 Calculations

Check calculations for date filter: End of previous quarter

    [Documentation]  Checking calculations for date filter: End of previous quarter
    [Tags]   calc                 date_filter

    Date Filter: End of previous quarter - Summary Calculations
    Date Filter: End of previous quarter - Cumulative Return Calculations
    Date Filter: End of previous quarter - PF Deposits Calculations
    Date Filter: End of previous quarter - PF Activity Group 1 Calculations

Check calculations for date filter: End of previous year

    [Documentation]  Checking calculations for date filter: End of previous year
    [Tags]   calc                 date_filter

    Date Filter: End of previous year - Summary Calculations
    Date Filter: End of previous year - Cumulative Return Calculations
    Date Filter: End of previous year - PF Deposits Calculations
    Date Filter: End of previous year - PF Activity Group 1 Calculations



# API calls for Trend Analysis Chart

Check Trend analysis for Assets under management

    [Documentation]  Checking API calls for Assets Under Management
    [Tags]  trend_analysis

    Total Portfolio - Assets Under Management: Trend Analysis Chart
    Total Portfolio - Assets Under Management: Trend
    Asset Class - Assets Under Management: Trend Analysis Chart
    Asset Class - Assets Under Management: Trend
    Currency - Assets Under Management: Trend Analysis Chart
    Currency - Assets Under Management: Trend
    Strategy - Assets Under Management: Trend Analysis Chart
    Strategy - Assets Under Management: Trend

Check Trend analysis for Allocation

    [Documentation]  Checking API calls for Allocation
    [Tags]  trend_analysis

    Asset Class - Allocation (monthly): Trend Analysis Chart
    Asset Class - Allocation (monthly): Trend
    Asset Class - Allocation (quarterly): Trend Analysis Chart
    Asset Class - Allocation (quarterly): Trend
    Currency - Allocation: Trend Analysis Chart
    Currency - Allocation: Trend
    Strategy - Allocation: Trend Analysis Chart
    Strategy - Allocation: Trend

Check Trend analysis for Cumulative return

    [Documentation]  Checking API calls for Cumulative Return
    [Tags]  trend_analysis

    Total Portfolio - Cumulative Return: Trend Analysis Chart
    Total Portfolio - Cumulative Return: Trend
    Total Portfolio - Cumulative Return (FXseparated): Trend Analysis Chart
    Total Portfolio - Cumulative Return (FXseparated): Trend
    Asset Class - Cumulative Return: Trend Analysis Chart
    Asset Class - Cumulative Return: Trend
    Currency - Cumulative Return: Trend Analysis Chart
    Currency - Cumulative Return: Trend
    Strategy - Cumulative Return: Trend Analysis Chart
    Strategy - Cumulative Return: Trend

Check Trend analysis for Return by period

    [Documentation]  Checking API calls for Return By Period
    [Tags]  trend_analysis

    Total Portfolio - Return By Period (monthly): Trend Analysis Chart
    Total Portfolio - Return By Period (monthly): Trend
    Total Portfolio - Return By Period (monthly - FXseparated): Trend Analysis Chart
    Total Portfolio - Return By Period (monthly - FXseparated): Trend
    Total Portfolio - Return By Period (daily): Trend Analysis Chart
    Total Portfolio - Return By Period (daily): Trend
    Total Portfolio - Return By Period (weekly): Trend Analysis Chart
    Total Portfolio - Return By Period (weekly): Trend
    Total Portfolio - Return By Period (quarterly): Trend Analysis Chart
    Total Portfolio - Return By Period (quarterly): Trend
    Asset Class - Return By Period: Trend Analysis Chart
    Asset Class - Return By Period: Trend
    Currency - Return By Period: Trend Analysis Chart
    Currency - Return By Period: Trend
    Strategy - Return By Period: Trend Analysis Chart
    Strategy - Return By Period: Trend

Check Trend analysis for Realized Volatility

    [Documentation]  Checking API calls for Realized Volatility
    [Tags]  trend_analysis

    Total Portfolio - Realized Volatility: Trend Analysis Chart
    Total Portfolio - Realized Volatility: Trend



# API calls for Summary Analysis

Check Summary Analysis

    [Documentation]  Checking API calls for Summary Analysis
    [Tags]  summary_analysis

    One Month - Summary Statistics
    One Month - Summary
    3 Months - Summary Statistics
    3 Months - Summary
    6 Months - Summary Statistics
    6 Months - Summary
    Year to Date - Summary Statistics
    Year to Date - Summary
    1 Year - Summary Statistics
    1 Year - Summary
    3 Years - Summary Statistics
    3 Years - Summary
    5 Years - Summary Statistics
    5 Years - Summary
    Since Inception - Summary Statistics
    Since Inception - Summary



# API calls for PF Activities Chart

Check Portfolio management

    [Documentation]  Checking API calls for Portfolio management
    [Tags]  pf_activities

    Asset Class: Allocation Changes - Portfolio Management (1 Year)
    Asset Class: Allocation Changes - Portfolio Management (1 Month)
    Asset Class: Allocation Changes - Portfolio Management (3 Months)
    Asset Class: Allocation Changes - Portfolio Management (6 Months)
    Asset Class: Allocation Changes - Portfolio Management (Year-to-Date)
    Asset Class: Allocation Changes - Portfolio Management (3 Years)
    Asset Class: Allocation Changes - Portfolio Management (5 Years)
    Asset Class: Allocation Changes - Portfolio Management (Since Inception)
    Asset Class: Quarterly Allocation Changes - Portfolio Management (1 Year)

    Asset Class: Allocation - Portfolio Management (1 Year)
    Asset Class: Allocation - Portfolio Management (1 Month)
    Asset Class: Allocation - Portfolio Management (3 Months)
    Asset Class: Allocation - Portfolio Management (6 Months)
    Asset Class: Allocation - Portfolio Management (Year-to-Date)
    Asset Class: Allocation - Portfolio Management (3 Years)
    Asset Class: Allocation - Portfolio Management (5 Years)
    Asset Class: Allocation - Portfolio Management (Since Inception)
    Asset Class: Quarterly Allocation - Portfolio Management (1 Year)

    Asset Class: Net Deposits/Withdrawals - Portfolio Management (1 Year)
    Asset Class: Net Deposits/Withdrawals - Portfolio Management (1 Month)
    Asset Class: Net Deposits/Withdrawals - Portfolio Management (3 Months)
    Asset Class: Net Deposits/Withdrawals - Portfolio Management (6 Months)
    Asset Class: Net Deposits/Withdrawals - Portfolio Management (Year-to-Date)
    Asset Class: Net Deposits/Withdrawals - Portfolio Management (3 Years)
    Asset Class: Net Deposits/Withdrawals - Portfolio Management (5 Years)
    Asset Class: Net Deposits/Withdrawals - Portfolio Management (Since Inception)
    Asset Class: Quarterly Net Deposits/Withdrawals - Portfolio Management (1 Year)

#    Account type: Deposits - Portfolio Management (1 Year)
#    Account type: Deposits - Portfolio Management (1 Month)
#    Account type: Deposits - Portfolio Management (3 Months)
#    Account type: Deposits - Portfolio Management (6 Months)
#    Account type: Deposits - Portfolio Management (Year-to-Date)
#    Account type: Deposits - Portfolio Management (3 Years)
#    Account type: Deposits - Portfolio Management (5 Years)
#    Account type: Deposits - Portfolio Management (Since Inception)
#    Account type: Quarterly Deposits - Portfolio Management (1 Year)
#
#    Account type: Withdrawals - Portfolio Management (1 Year)
#    Account type: Withdrawals - Portfolio Management (3 Months)
#    Account type: Withdrawals - Portfolio Management (6 Months)
#    Account type: Withdrawals - Portfolio Management (Year-to-Date)
#    Account type: Withdrawals - Portfolio Management (3 Years)
#    Account type: Withdrawals - Portfolio Management (5 Years)
#    Account type: Withdrawals - Portfolio Management (Since Inception)
#    Account type: Quarterly Withdrawals - Portfolio Management (1 Year)

    Currency: Allocation Changes - Portfolio Management (1 Year)
    Currency: Allocation - Portfolio Management (1 Year)

    Strategy: Allocation Changes - Portfolio Management (1 Year)
    Strategy: Allocation - Portfolio Management (1 Year)
#    Strategy: Net Deposits/Withdrawals - Portfolio Management (1 Year)
#    Strategy: Deposits - Portfolio Management (1 Year)
#    Strategy: Withdrawals - Portfolio Management (1 Year)
#
#    Mandate: Net Deposits/Withdrawals - Portfolio Management (1 Year)
#    Mandate: Deposits - Portfolio Management (1 Year)
#    Mandate: Withdrawals - Portfolio Management (1 Year)

Check PF activity

    [Documentation]  Checking API calls for PF activity
    [Tags]  pf_activities

    Asset Class: Allocation Changes - PF Activity (1 Year)
    Asset Class: Allocation Changes - PF Activity (1 Month)
    Asset Class: Allocation Changes - PF Activity (3 Months)
    Asset Class: Allocation Changes - PF Activity (6 Months)
    Asset Class: Allocation Changes - PF Activity (Year-to-Date)
    Asset Class: Allocation Changes - PF Activity (3 Years)
    Asset Class: Allocation Changes - PF Activity (5 Years)
    Asset Class: Allocation Changes - PF Activity (Since Inception)
    Asset Class: Quarterly Allocation Changes - PF Activity (1 Year)

    Asset Class: Allocation - PF Activity (1 Year)
    Asset Class: Allocation - PF Activity (1 Month)
    Asset Class: Allocation - PF Activity (3 Months)
    Asset Class: Allocation - PF Activity (6 Months)
    Asset Class: Allocation - PF Activity (Year-to-Date)
    Asset Class: Allocation - PF Activity (3 Years)
    Asset Class: Allocation - PF Activity (5 Years)
    Asset Class: Allocation - PF Activity (Since Inception)
    Asset Class: Quarterly Allocation - PF Activity (1 Year)

    Asset Class: Net Deposits/Withdrawals - PF Activity (1 Year)
    Asset Class: Net Deposits/Withdrawals - PF Activity (1 Month)
    Asset Class: Net Deposits/Withdrawals - PF Activity (3 Months)
    Asset Class: Net Deposits/Withdrawals - PF Activity (6 Months)
    Asset Class: Net Deposits/Withdrawals - PF Activity (Year-to-Date)
    Asset Class: Net Deposits/Withdrawals - PF Activity (3 Years)
    Asset Class: Net Deposits/Withdrawals - PF Activity (5 Years)
    Asset Class: Net Deposits/Withdrawals - PF Activity (Since Inception)
    Asset Class: Quarterly Net Deposits/Withdrawals - PF Activity (1 Year)

#    Account type: Deposits - PF Activity (1 Year)
#    Account type: Deposits - PF Activity (1 Month)
#    Account type: Deposits - PF Activity (3 Months)
#    Account type: Deposits - PF Activity (6 Months)
#    Account type: Deposits - PF Activity (Year-to-Date)
#    Account type: Deposits - PF Activity (3 Years)
#    Account type: Deposits - PF Activity (5 Years)
#    Account type: Deposits - PF Activity (Since Inception)
#    Account type: Quarterly Deposits - PF Activity (1 Year)
#
#    Account type: Withdrawals - PF Activity (1 Year)
#    Account type: Withdrawals - PF Activity (3 Months)
#    Account type: Withdrawals - PF Activity (6 Months)
#    Account type: Withdrawals - PF Activity (Year-to-Date)
#    Account type: Withdrawals - PF Activity (3 Years)
#    Account type: Withdrawals - PF Activity (5 Years)
#    Account type: Withdrawals - PF Activity (Since Inception)
#    Account type: Quarterly Withdrawals - PF Activity (1 Year)

    Currency: Allocation Changes - PF Activity (1 Year)
    Currency: Allocation - PF Activity (1 Year)

    Strategy: Allocation Changes - PF Activity (1 Year)
    Strategy: Allocation - PF Activity (1 Year)
#    Strategy: Net Deposits/Withdrawals - PF Activity (1 Year)
#    Strategy: Deposits - PF Activity (1 Year)
#    Strategy: Withdrawals - PF Activity (1 Year)

#    Mandate: Net Deposits/Withdrawals - PF Activity (1 Year)
#    Mandate: Deposits - PF Activity (1 Year)
#    Mandate: Withdrawals - PF Activity (1 Year)



# API calls for Past Performance Analysis Chart


Check Light cone analysis for past performance

    [Documentation]  Checking Light Cone Analysis API calls for Past Performance Analysis Chart
    [Tags]  past_performance

    Return Contribution: Light Cone Analysis (1 Year)

    Return: Light Cone Analysis (1 Year)

Check Return overview

    [Documentation]  Checking Return Overview API calls for Past Performance Analysis Chart
    [Tags]  past_performance

    Return Contribution: Return Contribution Overview (1 Year)
    Return Contribution: Return Contribution Overview (1 Month)
    Return Contribution: Return Contribution Overview (3 Months)
    Return Contribution: Return Contribution Overview (6 Months)
    Return Contribution: Return Contribution Overview (Year-to-Date)
    Return Contribution: Return Contribution Overview (3 Years)
    Return Contribution: Return Contribution Overview (5 Years)
    Return Contribution: Return Contribution Overview (Since Inception)

    Return: Return Overview (1 Year)
    Return: Return Overview (1 Month)
    Return: Return Overview (3 Months)
    Return: Return Overview (6 Months)
    Return: Return Overview (Year-to-Date)
    Return: Return Overview (3 Years)
    Return: Return Overview (5 Years)
    Return: Return Overview (Since Inception)

Check Past performance

    [Documentation]  Checking Past Performance API calls for Past Performance Analysis Chart
    [Tags]  past_performance

    Return Contribution: Past Performance (1 Year)
    Return Contribution: Past Performance (1 Month)
    Return Contribution: Past Performance (3 Months)
    Return Contribution: Past Performance (6 Months)
    Return Contribution: Past Performance (Year-to-Date)
    Return Contribution: Past Performance (3 Years)
    Return Contribution: Past Performance (5 Years)
    Return Contribution: Past Performance (Since Inception)

    Return: Past Performance (1 Year)
    Return: Past Performance (1 Month)
    Return: Past Performance (3 Months)
    Return: Past Performance (6 Months)
    Return: Past Performance (Year-to-Date)
    Return: Past Performance (3 Years)
    Return: Past Performance (5 Years)
    Return: Past Performance (Since Inception)



# API calls for present exposure chart

Check Present Exposure

    [Documentation]  Checking Present Exposure for '% of Portfolio' chart
    [Tags]  present_exposure

    Present Exposure






*** Settings ***

Documentation  Testing API calls in Monitor page.

Resource  ../Resources/MonitorOverview/initial_api.robot

Suite Teardown  Delete All Sessions


*** Variables ***


*** Test Cases ***

    # Initial API calls in 'Monitor - Overview' tab

Check d1g1t user login
    [Tags]  initial_overview     login
    Verify User Login

Check system status
    [Tags]  initial_overview     system_status
    System Status

Check global filter
    [Tags]  initial_overview     global_filter
    Global Filter

Check global selected filter
    [Tags]  initial_overview     global_filter
    Global Selected Filter

Check firm configuration
    [Tags]  initial_overview     firm_configuration
    Current Firm Configuration

Check current user
    [Tags]  initial_overview     current_user
    Current User

Check current user profile
    [Tags]  initial_overview     user_profile
    Current User Profile

Check ticker price
    [Tags]  initial_overview     ticker_price
    Ticker Price

Check grouping criteria
    [Tags]  initial_overview     grouping_criteria
    Grouping Criteria

Check trend analysis chart
    [Tags]  initial_overview     chart_trend             monitor_overview
    Monitor Overview: Trend Analysis Chart

Check summary statistics
    [Tags]  initial_overview     monitor_overview        summary_statistics
    Monitor Overview: Summary Statistics

Check light cone analysis
    [Tags]  initial_overview     monitor_overview        light_cone
    Monitor Overview: Light Cone Analysis

Check portfolio activity
    [Tags]  initial_overview     monitor_overview        portfolio_activity
    Monitor Overview: Portfolio Activity

Check light cone analysis for selected view
    [Tags]  initial_overview     monitor_overview        light_cone
    Monitor Overview - Selected View: Light Cone Analysis

Check global settings
    [Tags]  initial_overview     global_settings
    Global Settings

Check portfolio management
    [Tags]  initial_overview     global_settings         portfolio_management
    Global Settings: Portfolio Management

Check summary calculations
    [Tags]  initial_overview     calc                    summary
    Calculation: Summary
    Calculation: Summary USD

Check cumulative return trend calculations
    [Tags]  initial_overview     calc                    cumulative_return_trend
    Calculation: Cumulative Return Trend
    Calculation: Cumulative Return Trend USD

Check PF deposits calculations
    [Tags]  initial_overview     calc                    pf_deposits
    Calculation: PF Deposits
    Calculation: PF Deposits USD

Check PF activity calculations
    [Tags]  initial_overview     calc                    pf_activity
    Calculation: PF Activity
    Calculation: PF Activity USD

Check Trend - calculations
    [Tags]  initial_overview     calc                    trend
    Calculation: Trend
    Calculation: Trend USD

Check light cone analysis views
    [Tags]  initial_overview     views                   light_cone
    Views: Light Cone Analysis






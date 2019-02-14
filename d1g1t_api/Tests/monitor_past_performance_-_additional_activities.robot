*** Settings ***

Documentation  Testing API calls in Monitor page.

Resource  ../Resources/MonitorOverview/initial_api.robot
Resource  ../Resources/MonitorPastPerformance/trend_analysis_api.robot
Resource  ../Resources/MonitorPastPerformance/performance_analysis_api.robot
Resource  ../Resources/MonitorPastPerformance/contribution_analysis_api.robot

Suite Teardown  Delete All Sessions


*** Variables ***


*** Test Cases ***


# Create a new session

New Session

    [Documentation]  Creating a new user session
    [Tags]  login

    Verify User Login


# API calls for Trend Analysis Chart

Check Trend analysis for Total Return

    [Documentation]  Checking API calls for Total Return
    [Tags]  past_performance    trend_analysis

    Total Portfolio - Total Return: Trend Analysis Chart (1 year)
    Total Portfolio - Total Return: Trend Analysis Chart (1 Month)
    Total Portfolio - Total Return: Trend Analysis Chart (3 Months)
    Total Portfolio - Total Return: Trend Analysis Chart (6 Months)
    Total Portfolio - Total Return: Trend Analysis Chart (Year-to-Date)
    Total Portfolio - Total Return: Trend Analysis Chart (3 Years)
    Total Portfolio - Total Return: Trend Analysis Chart (5 Years)
    Total Portfolio - Total Return: Trend Analysis Chart (Since Inception)
    Total Portfolio - FX separated Total Return: Trend Analysis Chart (1 year)
    Asset Class - Total Return: Trend Analysis Chart (1 year)
    Currency - Total Return: Trend Analysis Chart (1 year)
    Strategy - Total Return: Trend Analysis Chart (1 year)

    Total Portfolio - Total Return: Trend (1 year)
    Total Portfolio - Total Return: Trend (1 Month)
    Total Portfolio - Total Return: Trend (3 Months)
    Total Portfolio - Total Return: Trend (6 Months)
    Total Portfolio - Total Return: Trend (Year-to-Date)
    Total Portfolio - Total Return: Trend (3 Years)
    Total Portfolio - Total Return: Trend (5 Years)
    Total Portfolio - Total Return: Trend (Since Inception)
    Total Portfolio - FX separated Total Return: Trend (1 year)
    Asset Class - Total Return: Trend (1 year)
    Currency - Total Return: Trend (1 year)
    Strategy - Total Return: Trend (1 year)

Check Trend analysis for Return By Period

    [Documentation]  Checking API calls for Return By Period
    [Tags]  past_performance    trend_analysis

    Total Portfolio - Return By Period: Trend Analysis Chart (1 year)
    Total Portfolio - Return By Period: Trend Analysis Chart (1 Month)
    Total Portfolio - Return By Period: Trend Analysis Chart (3 Months)
    Total Portfolio - Return By Period: Trend Analysis Chart (6 Months)
    Total Portfolio - Return By Period: Trend Analysis Chart (Year-to-Date)
    Total Portfolio - Return By Period: Trend Analysis Chart (3 Years)
    Total Portfolio - Return By Period: Trend Analysis Chart (5 Years)
    Total Portfolio - Return By Period: Trend Analysis Chart (Since Inception)
    Total Portfolio - FX separated Return By Period: Trend Analysis Chart (1 year)
    Total Portfolio - 'Daily' Return By Period: Trend Analysis Chart (1 year)
    Total Portfolio - 'Weekly' Return By Period: Trend Analysis Chart (1 year)
    Total Portfolio - 'Quarterly' Return By Period: Trend Analysis Chart (1 year)
    Asset Class - Return By Period: Trend Analysis Chart (1 year)
    Currency - Return By Period: Trend Analysis Chart (1 year)
    Strategy - Return By Period: Trend Analysis Chart (1 year)

    Total Portfolio - Return By Period: Trend (1 year)
    Total Portfolio - Return By Period: Trend (1 Month)
    Total Portfolio - Return By Period: Trend (3 Months)
    Total Portfolio - Return By Period: Trend (6 Months)
    Total Portfolio - Return By Period: Trend (Year-to-Date)
    Total Portfolio - Return By Period: Trend (3 Years)
    Total Portfolio - Return By Period: Trend (5 Years)
    Total Portfolio - Return By Period: Trend (Since Inception)
    Total Portfolio - FX separated Return By Period: Trend (1 year)
    Total Portfolio - 'Daily' Return By Period: Trend (1 year)
    Total Portfolio - 'Weekly' Return By Period: Trend (1 year)
    Total Portfolio - 'Quarterly' Return By Period: Trend (1 year)
    Asset Class - Return By Period: Trend (1 year)
    Currency - Return By Period: Trend (1 year)
    Strategy - Return By Period: Trend (1 year)

Check Trend analysis for Realized Volatility

    [Documentation]  Checking API calls for Realized Volatility
    [Tags]  past_performance    trend_analysis

    Total Portfolio - Realized Volatility: Trend Analysis Chart (1 year)
    Total Portfolio - Realized Volatility: Trend Analysis Chart (1 Month)
    Total Portfolio - Realized Volatility: Trend Analysis Chart (3 Months)
    Total Portfolio - Realized Volatility: Trend Analysis Chart (6 Months)
    Total Portfolio - Realized Volatility: Trend Analysis Chart (Year-to-Date)
    Total Portfolio - Realized Volatility: Trend Analysis Chart (3 Years)
    Total Portfolio - Realized Volatility: Trend Analysis Chart (5 Years)
    Total Portfolio - Realized Volatility: Trend Analysis Chart (Since Inception)

    Total Portfolio - Realized Volatility: Trend (1 year)
    Total Portfolio - Realized Volatility: Trend (1 Month)
    Total Portfolio - Realized Volatility: Trend (3 Months)
    Total Portfolio - Realized Volatility: Trend (6 Months)
    Total Portfolio - Realized Volatility: Trend (Year-to-Date)
    Total Portfolio - Realized Volatility: Trend (3 Years)
    Total Portfolio - Realized Volatility: Trend (5 Years)
    Total Portfolio - Realized Volatility: Trend (Since Inception)


# APi calls for Performance analysis chart:

Check Performance for Household Name

    [Documentation]  Checking Household Name API calls for performance analysis
    [Tags]  past_performance    performance_analysis

    Household Name - Performance Range

Check Performance for Client Name

    [Documentation]  Checking Client Name API calls for performance analysis
    [Tags]  past_performance    performance_analysis

    Client Name - Performance Range

Check Performance for Security Asset Class

    [Documentation]  Checking Security Asset Class API calls for performance analysis
    [Tags]  past_performance    performance_analysis

    Security Asset Class - Performance Range

Check Performance for Security Name

    [Documentation]  Checking Security Name API calls for performance analysis
    [Tags]  past_performance    performance_analysis

    Security Name - Performance Range

Check Performance for Security Strategy

    [Documentation]  Checking Security Strategy API calls for performance analysis
    [Tags]  past_performance    performance_analysis

    Security Strategy - Performance Range

Check Performance for Household

    [Documentation]  Checking Household API calls for performance analysis
    [Tags]  past_performance    performance_analysis

    Household - Global Settings

    Household - Top Performers
    Household - Top Performers (3 Years)
    Household - Top Performers (5 Years)
    Household - Top Performers (Year-to-Date)
    Household - Top Performers (Since Inception)

    Household - Bottom Performers
    Household - Bottom Performers (3 Years)
    Household - Bottom Performers (5 Years)
    Household - Bottom Performers (Year-to-Date)
    Household - Bottom Performers (Since Inception)

Check Performance for Client

    [Documentation]  Checking Client API calls for performance analysis
    [Tags]  past_performance    performance_analysis

    Client - Top Performers
    Client - Top Performers (3 Years)
    Client - Top Performers (5 Years)
    Client - Top Performers (Year-to-Date)
    Client - Top Performers (Since Inception)

    Client - Bottom Performers
    Client - Bottom Performers (3 Years)
    Client - Bottom Performers (5 Years)
    Client - Bottom Performers (Year-to-Date)
    Client - Bottom Performers (Since Inception)

Check Performance for Security

    [Documentation]  Checking Security API calls for performance analysis
    [Tags]  past_performance    performance_analysis

    Security - Top Performers
    Security - Top Performers (3 Years)
    Security - Top Performers (5 Years)
    Security - Top Performers (Year-to-Date)
    Security - Top Performers (Since Inception)

    Security - Bottom Performers
    Security - Bottom Performers (3 Years)
    Security - Bottom Performers (5 Years)
    Security - Bottom Performers (Year-to-Date)
    Security - Bottom Performers (Since Inception)


# APi calls for Contribution analysis:

Check Contribution for Strategy

    [Documentation]  Checking Strategy API calls for Contribution analysis
    [Tags]  past_performance    contribution_analysis

    Strategy - Total Return: Contribution
    Strategy - Total Return: Contribution (3 Years)
    Strategy - Total Return: Contribution (5 Years)
    Strategy - Total Return: Contribution (Year-to-Date)
    Strategy - Total Return: Contribution (Since Inception)

    Strategy - Trailing Returns: Contribution

    Strategy - Return By Period: Contribution
    Strategy - Return By Period: Contribution (3 Years)
    Strategy - Return By Period: Contribution (5 Years)
    Strategy - Return By Period: Contribution (Year-to-Date)
    Strategy - Return By Period: Contribution (Since Inception)
    Strategy - Quarterly Return By Period: Contribution

Check Contribution - Drilldown for Strategy

    [Documentation]  Checking Strategy API calls for Contribution - Drilldown
    [Tags]  past_performance    contribution_drilldown

    Strategy - Total Return: Contribution - Drilldown
    Strategy - Total Return: Contribution - Drilldown (3 Years)
    Strategy - Total Return: Contribution - Drilldown (5 Years)
    Strategy - Total Return: Contribution - Drilldown (Year-to-Date)
    Strategy - Total Return: Contribution - Drilldown (Since Inception)

    Strategy - Trailing Returns: Contribution - Drilldown

    Strategy - Return By Period: Contribution - Drilldown
    Strategy - Return By Period: Contribution - Drilldown (3 Years)
    Strategy - Return By Period: Contribution - Drilldown (5 Years)
    Strategy - Return By Period: Contribution - Drilldown (Year-to-Date)
    Strategy - Return By Period: Contribution - Drilldown (Since Inception)
    Strategy - Quarterly Return By Period: Contribution - Drilldown

Check Client Position List for Strategy

    [Documentation]  Checking Strategy API calls for Client Position List
    [Tags]  past_performance    client_position_list

    Strategy - Total Return: Client Position List
    Strategy - Total Return: Client Position List (3 Years)
    Strategy - Total Return: Client Position List (5 Years)
    Strategy - Total Return: Client Position List (Year-to-Date)
    Strategy - Total Return: Client Position List (Since Inception)

    Strategy - Trailing Returns: Client Position List

    Strategy - Return By Period: Client Position List
    Strategy - Return By Period: Client Position List (3 Years)
    Strategy - Return By Period: Client Position List (5 Years)
    Strategy - Return By Period: Client Position List (Year-to-Date)
    Strategy - Return By Period: Client Position List (Since Inception)
    Strategy - Quarterly Return By Period: Client Position List

Check Infographic Monitor for Strategy

    [Documentation]  Checking Strategy API calls for Infographic Monitor
    [Tags]  past_performance    infographic_monitor

    Strategy - Total Return: Infographic Monitor
    Strategy - Total Return: Infographic Monitor (3 Years)
    Strategy - Total Return: Infographic Monitor (5 Years)
    Strategy - Total Return: Infographic Monitor (Year-to-Date)
    Strategy - Total Return: Infographic Monitor (Since Inception)

    Strategy - Trailing Returns: Infographic Monitor

    Strategy - Return By Period: Infographic Monitor
    Strategy - Return By Period: Infographic Monitor (3 Years)
    Strategy - Return By Period: Infographic Monitor (5 Years)
    Strategy - Return By Period: Infographic Monitor (Year-to-Date)
    Strategy - Return By Period: Infographic Monitor (Since Inception)
    Strategy - Quarterly Return By Period: Infographic Monitor

Check Contribution for Asset Class

    [Documentation]  Checking Asset Class API calls for Contribution analysis
    [Tags]  past_performance    contribution_analysis

    Asset Class - Total Return: Contribution

    Asset Class - Trailing Returns: Contribution

    Asset Class - Return By Period: Contribution

Check Contribution - Drilldown for Asset Class

    [Documentation]  Checking Asset Class API calls for Contribution - Drilldown
    [Tags]  past_performance    contribution_drilldown

    Asset Class - Total Return: Contribution - Drilldown

    Asset Class - Trailing Returns: Contribution - Drilldown

    Asset Class - Return By Period: Contribution - Drilldown

Check Client Position List for Asset Class

    [Documentation]  Checking Asset Class API calls for Client Position List
    [Tags]  past_performance    client_position_list

    Asset Class - Total Return: Client Position List

    Asset Class - Trailing Returns: Client Position List

    Asset Class - Return By Period: Client Position List

Check Infographic Monitor for Asset Class

    [Documentation]  Checking Asset Class API calls for Infographic Monitor
    [Tags]  past_performance    infographic_monitor

    Asset Class - Total Return: Infographic Monitor

    Asset Class - Trailing Returns: Infographic Monitor

    Asset Class - Return By Period: Infographic Monitor

Check Contribution for Currency

    [Documentation]  Checking Currency API calls for Contribution analysis
    [Tags]  past_performance    contribution_analysis

    Currency - Total Return: Contribution

    Currency - Trailing Returns: Contribution

    Currency - Return By Period: Contribution

Check Contribution - Drilldown for Currency

    [Documentation]  Checking Currency API calls for Contribution - Drilldown
    [Tags]  past_performance    contribution_drilldown

    Currency - Total Return: Contribution - Drilldown

    Currency - Trailing Returns: Contribution - Drilldown

    Currency - Return By Period: Contribution - Drilldown

Check Client Position List for Currency

    [Documentation]  Checking Currency API calls for Client Position List
    [Tags]  past_performance    client_position_list

    Currency - Total Return: Client Position List

    Currency - Trailing Returns: Client Position List

    Currency - Return By Period: Client Position List

Check Infographic Monitor for Currency

    [Documentation]  Checking Currency API calls for Infographic Monitor
    [Tags]  past_performance    infographic_monitor

    Currency - Total Return: Infographic Monitor

    Currency - Trailing Returns: Infographic Monitor

    Currency - Return By Period: Infographic Monitor

Check Contribution for Security

    [Documentation]  Checking Security API calls for Contribution analysis
    [Tags]  past_performance    contribution_analysis

    Security - Total Return: Contribution

    Security - Trailing Returns: Contribution

    Security - Return By Period: Contribution

Check Contribution - Drilldown for Security

    [Documentation]  Checking Security API calls for Contribution - Drilldown
    [Tags]  past_performance    contribution_drilldown

    Security - Total Return: Contribution - Drilldown

    Security - Trailing Returns: Contribution - Drilldown

    Security - Return By Period: Contribution - Drilldown

Check Client Position List for Security

    [Documentation]  Checking Security API calls for Client Position List
    [Tags]  past_performance    client_position_list

    Security - Total Return: Client Position List

    Security - Trailing Returns: Client Position List

    Security - Return By Period: Client Position List

Check Infographic Monitor for Security

    [Documentation]  Checking Security API calls for Infographic Monitor
    [Tags]  past_performance    infographic_monitor

    Security - Total Return: Infographic Monitor

    Security - Trailing Returns: Infographic Monitor

    Security - Return By Period: Infographic Monitor







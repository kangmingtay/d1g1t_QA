*** Settings ***

Documentation  Testing API calls in Monitor page.

Resource  ../Resources/MonitorOverview/initial_api.robot
Resource  ../Resources/MonitorPastPerformance/trend_analysis_api.robot
Resource  ../Resources/MonitorPastPerformance/performance_analysis_api.robot

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










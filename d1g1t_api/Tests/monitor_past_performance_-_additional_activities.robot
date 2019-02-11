*** Settings ***

Documentation  Testing API calls in Monitor page.

Resource  ../Resources/MonitorOverview/initial_api.robot
Resource  ../Resources/MonitorPastPerformance/trend_analysis_api.robot

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












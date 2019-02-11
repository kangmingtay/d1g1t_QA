*** Settings ***

Documentation  Testing API calls in Monitor page.

Resource  ../Resources/MonitorOverview/initial_api.robot
Resource  ../Resources/MonitorPastPerformance/initial_api.robot

Suite Teardown  Delete All Sessions


*** Variables ***


*** Test Cases ***


# Create a new session

New Session

    [Documentation]  Creating a new user session
    [Tags]  login

    Verify User Login

Check Global Filter

    [Documentation]  Checking API calls for 'Global Filter'
    [Tags]  past_performance

    Past Performance: Global Filter

Check Global Selected Filter

    [Documentation]  Checking API calls for 'Global Selected Filter'
    [Tags]  past_performance

    Past Performance: Global Selected Filter

Check Trend Analysis Chart

    [Documentation]  Checking API calls for 'Trend Analysis Chart'
    [Tags]  past_performance

    Past Performance: Trend Analysis Chart

Check Tickers Price

    [Documentation]  Checking API calls for 'Tickers Price'
    [Tags]  past_performance

    Past Performance: Tickers Price

Check Graphic Info

    [Documentation]  Checking API calls for 'Graphic Info'
    [Tags]  past_performance

    Past Performance: Graphic Info

Check Performance Range

    [Documentation]  Checking API calls for 'Performance Range'
    [Tags]  past_performance

    Past Performance: Performance Range

Check Contribution

    [Documentation]  Checking API calls for 'Contribution'
    [Tags]  past_performance

    Past Performance: Contribution

Check Cumulative Return

    [Documentation]  Checking API calls for 'Cumulative Return'
    [Tags]  past_performance

    Past Performance: Cumulative Return









*** Settings ***

Documentation  Testing API calls in Monitor page 'Present Exposure' tab.

Resource  ../Resources/MonitorOverview/initial_api.robot
Resource  ../Resources/MonitorPresentExposure/initial_api.robot

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
    [Tags]  present_exposure

    Present Exposure: Global Filter

Check Global Selected Filter

    [Documentation]  Checking API calls for 'Global Selected Filter'
    [Tags]  present_exposure

    Present Exposure: Global Selected Filter

Check Global Settings

    [Documentation]  Checking API calls for 'Global Settings'
    [Tags]  present_exposure

    Present Exposure: Global Settings

Check Top Bottom Performers

    [Documentation]  Checking API calls for 'Top Bottom Performers'
    [Tags]  present_exposure

    Present Exposure: Top Bottom Performers

Check Tickers Price

    [Documentation]  Checking API calls for 'Tickers Price'
    [Tags]  present_exposure

    Present Exposure: Tickers Price

Check Graphic Info

    [Documentation]  Checking API calls for 'Graphic Info'
    [Tags]  present_exposure

    Present Exposure: Graphic Info

Check First Selected View

    [Documentation]  Checking API calls for 'First Selected View'
    [Tags]  present_exposure

    Present Exposure: First Selected View

Check Second Selected View

    [Documentation]  Checking API calls for 'Second Selected View'
    [Tags]  present_exposure

    Present Exposure: Second Selected View

Check Third Selected View

    [Documentation]  Checking API calls for 'Third Selected View'
    [Tags]  present_exposure

    Present Exposure: Third Selected View

Check Present Exposure Grouping Criteria - 1

    [Documentation]  Checking API calls for 'Grouping Criteria - 1'
    [Tags]  present_exposure

    Present Exposure: Grouping Criteria - 1

Check Present Exposure Grouping Criteria - 3

    [Documentation]  Checking API calls for 'Grouping Criteria - 3'
    [Tags]  present_exposure

    Present Exposure: Grouping Criteria - 3

Check Present Exposure Grouping Criteria - 44

    [Documentation]  Checking API calls for 'Grouping Criteria - 44'
    [Tags]  present_exposure

    Present Exposure: Grouping Criteria - 44

Check Trend Analysis

    [Documentation]  Checking API calls for 'Trend Analysis'
    [Tags]  present_exposure

    Present Exposure: Trend Analysis

Check Contribution

    [Documentation]  Checking API calls for 'Contribution'
    [Tags]  present_exposure

    Present Exposure: Contribution

























# Robot Framework

  ## Prerequisites to run robot test scripts
    1. Python 3.5 or above
    2. Robot Framework
    3. Robot Framework 'RequestsLibrary' for API tests.
    4. Robot Framework 'SeleniumLibrary' for UI test.
   
  ## Installation
    1. To install Robot Framework, use 'pip install robotframework' command.
    2. To install RequestsLibrary, use 'pip install robotframework-requests' command.
    3. To install SeleniumLibrary, use 'pip install robotframework-seleniumlibrary' command.
    
  ## Running the tests
    To run the test, first go to the project location (i.e. 'd1g1t_api') using the command line, then run a test using 'robot'
    command. Some commands to run the existing tests are folling.
    
  #### API calls during the initial loading of the 'Monitor' page 'Overview' tab:
    
      robot -v ENV:dev -d results/monitor/overview/firstload tests/monitor_overview_-_first_load.robot
      
  #### API calls during additional activities in the 'Monitor' page 'Overview' tab:
      
      robot -v ENV:dev -d results/monitor/overview/activities tests/monitor_overview_-_additional_activities.robot
      
  #### API calls during the initial loading of the 'Monitor' page 'Past Performance' tab:
      
      robot -v ENV:dev -d results/monitor/pastperformance/firstload tests/monitor_past_performance_-_first_load.robot
      
  #### API calls during additional activities in the 'Monitor' page 'Past Performance' tab:
      
      robot -v ENV:dev -d results/monitor/pastperformance/activities tests/monitor_past_performance_-_additional_activities.robot
      
  #### Run all the tests in single command:
  
      robot -v ENV:dev -d results tests
      

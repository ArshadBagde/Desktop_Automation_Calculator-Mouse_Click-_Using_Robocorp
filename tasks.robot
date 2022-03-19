#Methods for Desktop Automation
#1-Using Image
#2-Using Keys
#3-Accessibility Insights

*** Settings ***
Documentation     Template robot main suite.
Library           RPA.Desktop.Windows
Library           RPA.core.notebook
Library           String
Library           RPA.RobotLogListener

*** Keywords ***
Calculator
    [Arguments]    ${first_number}    ${second_number}
    Open Executable    calc.exe    Calculator
    ${first_char}=    Split String To Characters    ${first_number}
    FOR    ${i}    IN    @{first_char}
        Mouse Click    id:num${i}Button
    END
    Mouse Click    id:plusButton
    ${second_char}=    Split String To Characters    ${second_number}
    FOR    ${i}    IN    @{second_char}
        Mouse Click    id:num${i}Button
    END
    Mouse Click    id:equalButton
    ${result}=    Get Text    id:CalculatorResults
    ${data}=    Get Regexp Matches    ${result['legacy_name']}    (?<=Display is ).*
    Notebook Print    ${data[0]}
    Quit Application

*** Tasks ***
Minimal task
    Calculator    5555    8888888

*** Settings ***
Documentation       Pure Sikuli Library Demo without SeleniumLibrary
Suite Setup         Custom Suite Setup
Test Setup          Add Needed Image Path
Test Teardown       Stop Remote Server
Library             SikuliLibrary

*** Variables ***
${IMAGE_DIR}        ./img
@{MENU_REGION} =    0  0  800  300
${CENTER_W} =       600
${CENTER_H} =       300

*** Test Cases ***
Sikuli Hellow World
    [Documentation]             Sikuli Sample Test
    Demo Click Region and Menu
    Open Google in New Tab
    Google Search Hello

*** Keywords ***
Add Needed Image Path
    [Documentation]             Initial test setup
    Add Image Path              ${IMAGE_DIR}
    Set Show Actions            True
    Set Move Mouse Delay        0.2
    Set Slow Motion Delay       0.2
    # Set Min Similarity          0.3     # for debug

Custom Suite Setup
    [Documentation]     Demo dynamically calculate region
    @{coordinates} =    Get Screen Coordinates
    ${CENTER_X} =       Evaluate  (${coordinates[2]} - ${CENTER_W}) // 2
    ${CENTER_Y} =       Evaluate  (${coordinates[3]} - ${CENTER_H}) // 2
    @{CENTER} =         Create List  ${CENTER_X}  ${CENTER_Y}  ${CENTER_W}  ${CENTER_H}
    Set Suite Variable  @{CENTER}

Demo Click Region and Menu
    # assuming clicking Chrome window
    Highlight Region            ${MENU_REGION}  1   # demo hard coded region
    Click Region                ${MENU_REGION}

    # not sure Roi is working for Click Text so maybe you don't need this.
    # (at least, the report becomes concise when the result is error.)
    Set Roi                     ${MENU_REGION}

    # select menu is sometimes unstable so better to sleep a little
    Sleep                       0.1s
    Click Text                  File
    Sleep                       0.1s
    Click Text                  New Incognito Window

    Reset Roi

    Highlight Region            ${CENTER}  1        # demo calculated region
    Click Region                ${CENTER}
    # User input is also possible.
    # @{SelectedRegion} =         Select Region   Please select the region.

Open Google in New Tab
    Click                       chrome_new_tab.png
    Sleep                       0.1s
    Click Text                  Now you can browse privately
    Click Text                  Search Google or type a URL
    Input Text                  ${EMPTY}  https://google.com
    Press Special Key           ENTER

Google Search Hello
    Wait Until Screen Contain   google_search_input.png  10
    Input Text                  google_search_input.png  Hello
    Wait Until Screen Contain   google_search_button.png  5
    Click                       google_search_button.png

    Wait Until Screen Contain   adele_hello.png  5
    Screen Should Contain       adele_hello.png

    Sleep                       1s  # just in case of rendering delay

    ${SEARCH_RESULT_RESION} =   Get Extended Region From    adele_hello.png  below  1
    ${SEARCH_RESULT} =          Read Text From Region   ${SEARCH_RESULT_RESION}
    Should Contain              ${SEARCH_RESULT}    Adele - Hello - YouTube

    Capture Screen

    # Click Text                  Adele - Hello - YouTube

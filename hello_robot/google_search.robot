*** Settings ***
Documentation   サンプル Robot テスト
Library         SeleniumLibrary
Library         DebugLibrary
Library         DataDriver  file=my_data_file.csv  dialect=unix  encoding=utf_8
Suite setup     ブラウザを開く
Suite Teardown  Close Browser
Test Template   Google検索するテスト


*** Variables ***
${URL}              https://google.co.jp


# *** Test Cases ***  KEY_WORD            RES_COUNT
# 検索タイプ1         SeleniumLibrary     9
# 検索タイプ2         hoge                11

*** Test Case ***
${KEY_WORD} でGoogle検索し ${RES_COUNT} を確認  Yahoo  10


*** Keywords ***
ブラウザを開く
    [Documentation]     初期化処理
    Set Selenium speed  0.5s
    Open Browser        ${URL}  Chrome
    Title Should Be     Google

Google検索するテスト
    [Documentation]     検索結果の件数を確認するテスト
    [Arguments]         ${KEY_WORD}     ${RES_COUNT}

    Input Text  name=q  ${KEY_WORD}
    Press Key   name=q  \\13

    Capture Page Screenshot     filename=selenium-screenshot-${KEY_WORD}.png

    ${links} =  Get Webelements  css=a > h3

    # Debug

    :For  ${link}  IN  @{links}
        \  ${text} =  Get Text  ${link}
        \  Log To Console  ${text}

    Length Should Be   ${links}  ${RES_COUNT}

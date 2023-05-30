*** Settings ***
Resource  ../resources/config.resource

*** Keywords ***
I search for
    [Arguments]  ${searchPhrase}
    Input Text  css=${searchInput}  ${searchPhrase}
    Click Element   css=.main-search--button

I see alert message
    [Arguments]  ${expectedMessage}
    Wait Until Element Is Visible    css=div.alert.is--warning > div.alert--content
    Element Text Should Be  css=div.alert.is--warning > div.alert--content  ${expectedMessage}

I type in search
    [Arguments]    ${searchPhrase}
    Input Text  css=${searchInput}   ${searchPhrase}

filter should be selected with text
    [Arguments]  ${filterText}
    Wait Until Element Is Visible  css=.dfd-btn-term-filter.dfd-is-selected > span:nth-child(1)
    Element Text Should Be  css=.dfd-btn-term-filter.dfd-is-selected > span:nth-child(1)   ${filterText}

I see quick search results with products
    Wait Until Element Is Visible  css=.dfd-root
    Element Should Be Visible  css=.dfd-root

*** Test Cases ***
Search for HEAD products, go to first product page and search for Nike products
    Given I visit  ${HOME_PAGE}

    When I search for  Head
    Then I see products

    When I open first product on the list
    Then I see product details

    When I search for  Nike
    Then I see products

Search when no results found
    Given I visit  ${HOME_PAGE}
    When I search for  asdfklajhdfkjahdf
    Then I see alert message  Nie produktów odpowiadających Twoim kryteriom wyszukiwania

Type HEAD in search input will show quick search results in popup with marked filter
    Given I visit  ${HOME_PAGE}
    When I type in search  HEAD
    Then I see quick search results with products
    And filter should be selected with text  Head

Type nike in search input will show quick product view popup with marked filter
    Given I visit  ${HOME_PAGE}
    When I type in search  nike
    Then filter should be selected with text  Nike

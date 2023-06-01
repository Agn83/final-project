*** Settings ***
Resource  ../resources/config.resource

*** Variables ***
${HEAD_MANUFACTURER}  106

*** Keywords ***
I select manufacturer filter
    [Arguments]  ${manufacturerId}
    Click element  css=.facet--manufacturer
    Wait Until Element Is Visible    css=.facet--manufacturer .filter-panel--content
    Click element    css=.facet--manufacturer .filter-panel--label[for='__s__${manufacturerId}']
    Wait for products loading


*** Test Cases ***
Show products in category
    When I visit  ${RACKETS_CATEGORY_PAGE}
    Then I see products

Filter products in category
    When I visit  ${RACKETS_CATEGORY_PAGE}
    Then I see products

    When I select manufacturer filter  ${HEAD_MANUFACTURER}
    Then I see products
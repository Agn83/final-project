*** Settings ***
Resource  ../resources/config.resource

*** Variables ***
${firstnameInput}  input#firstname
${lastnameInput}  input#lastname
${emailInput}  input#register_personal_email

${registerButton}  .register--submit

*** Keywords ***
I try to continue registration
    Wait Until Element Is Visible  css=${registerButton}
    Click Element  css=${registerButton}

input field has error
    [Arguments]  ${element}
    Element Should Be Visible  css=${element}.has--error

input field has no error
    [Arguments]  ${element}
    Element Should Not Be Visible  css=${element}.has--error

I enter data in register form input
    [Arguments]  ${element}  ${value}
    Wait Until Element Is Visible  css=${element}
    Input Text  css=${element}  ${value}


*** Test Cases ***
Register customer without providing any data
    Given I visit  ${REGISTER_CUSTOMER_PAGE}
    Given I Accept Cookies Consent
    When I try to continue registration
    Then input field has error  ${firstnameInput}
    And input field has error  ${lastnameInput}
    And input field has error  ${emailInput}

Register customer providing only firstname and lastname
    Given I visit  ${REGISTER_CUSTOMER_PAGE}
    And I enter data in register form input  ${firstnameInput}  A.
    And I enter data in register form input  ${lastnameInput}  B.
    When I try to continue registration
    Then input field has no error  ${firstnameInput}
    And input field has no error  ${lastnameInput}
    And input field has error  ${emailInput}
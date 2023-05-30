*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
I visit
    [Arguments]  ${pageUrl}
    open browser  ${pageUrl}  ${browser}

I see products
    Wait Until Element Is Visible    css=.listing
    Element Should Be Visible   css=.listing .product--box

I see product details
    Element Should Be Visible    css=.product--title
    Element Should Be Visible    css=.product--price
    Element Should Be Visible    css=.product--parameters
    Element Should Be Visible    css=.product--delivery
    Element Should Be Visible    css=.product--image-container

Wait for products loading
    Wait Until Page Contains Element   css=.listing.is--loading
    Wait Until Page Does Not Contain Element   css=.listing.is--loading

I accept cookies consent
    Wait Until Element Is Visible  css=.cookie-permission--accept-button
    Click element  css=.cookie-permission--accept-button

I open first product on the list
    Click Element   css=${firstProductOnListing} .product--title
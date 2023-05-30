*** Settings ***
Resource  ../resources/config.resource

*** Keywords ***
I go to product found on home page
    Wait Until Element Is Visible    css=.product-slider--container
    Sleep  3
    Click Element    css=.product-slider--container > .product-slider--item .product--box .product--image

I add product to basket
    Click Element  css=.buybox--button

I see that product was added to basket
    Wait Until Element Is Visible    css=.container--ajax-cart

*** Test Cases ***
Add product from products category
    Given I visit  ${BALLS_CATEGORY_PAGE}
    When I open first product on the list
    Then I see product details

    When I add product to basket
    Then I see that product was added to basket
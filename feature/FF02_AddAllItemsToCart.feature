Feature: AddAllItemsToCart
  Scenario: Add all items from product page to cart and from cart page remove all items and verify the same
    Given user adds all Products to cart
    Then clicks on mini cart and user get navigates to cart page
    Then user removes all products form cart page
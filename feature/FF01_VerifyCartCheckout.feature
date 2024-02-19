Feature: AddAllItemsToCart
  Scenario: Add and Item to cart and check if its added to cart
    Given user on Products page
    Then add a product to cart
    And verify one product added to cart
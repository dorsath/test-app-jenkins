Feature: Homepage

  @javascript
  Scenario: Show homepage with all the products
    Given I have a couple of products
    When I am looking at the homepage
    Then I should see the homepage

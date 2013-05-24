Feature: Pay what you can
  As a Loomio user
  So that I can support the project
  I would like to pay a monetary contribution to Loomio

  Scenario: Signed in user pays a monthly contribution
    Given I am logged in
    And I am on the pay what you can page
    When I choose a monthly contribution of $2
    Then I should see the SwipeHQ payment page for a monthly $2 payment

    When I fill in and submit the payment page
    Then I should see a confirmation page thanking me for my contribution

  Scenario: Signed in user pays a once-off contribution
    Given I am logged in
    And I am on the pay what you can page
    When I choose a once-off contribution of $10
    Then I should see the SwipeHQ payment page for a once-off $10 payment

    When I fill in and submit the payment page
    Then I should see a confirmation page thanking me for my contribution

  Scenario: Signed out user pays a monthly contribution
    When I visit the pay what you can page
    Then I be should be redirected to the sign in page

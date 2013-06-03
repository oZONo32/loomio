Feature: Individual requests group membership
  As a signed in OR signed out individual
  So that I can participate in discussions I'm interested in
  I want to be able to join groups

  # @javascript
  Scenario: Signed-out individual requests membership (Open group)
    Given I am not logged in
    And an open group exists
    When I visit the group page
    And I click "Request membership"
    And I fill in and submit the Request membership form
    Then I should see a flash message confirming my membership request

  # @javascript
  Scenario: Signed-in individual requests membership (Open group)
    Given I am logged in
    And an open group exists
    When I visit the group page
    And I click "Request membership"
    And fill in and submit the Request membership form (introduction only)
    Then I should see a flash message confirming my membership request

  # @javascript
  Scenario: Group coordinator approves membership request from signed-out user
    Given there is a membership request from a signed-out user
    And I am a logged in coordinator of the group
    When I approve the membership request
    Then I should see a flash message confirming the membership request was approved
    And the requester should be sent an invitation to join the group

  Scenario: Group coordinator approves membership request from signed-out user
    Given there is a membership request from a signed-in user
    And I am a logged in coordinator of the group
    When I approve the membership request
    Then I should see a flash message confirming the membership request was approved
    And the requester should be added to the group

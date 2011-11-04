@web
Feature: Logging in
  In order to use the backend of the site
  As an overlord
  I want to be able to log in and out

  @web
  Scenario: Logging in
    Given I am not logged in
    When I go to the log in page
    And I enter my log in details
    Then I should be viewing the overlord dashboard
    And I should have a login cookie

  @web
  Scenario: Trying to log in twice
    Given I am logged in
    When I go to the log in page
    Then I should be viewing the homepage

  @web
  Scenario: Trying to log out while logged out
    Given I am not logged in
    When I go to the log out page
    Then I should be viewing the homepage

  @web
  Scenario: Logging out
    Given I am logged in
    And I am viewing the homepage
    When I click log out
    Then I should be viewing the homepage
    And I should not see my username
    And I should not have a login cookie
    And I should see a logged out message


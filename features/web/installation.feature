@web
Feature: Site installation
  In order to set up the site
  As an overlord
  I want to be able to access the install page

  @web
  Scenario: Accessing the install page on a fresh site
    Given It's a fresh site
    When I go to the install page 
    Then I should be viewing the install page

  @web @important
  Scenario: Accessing the install page on an already set-up site
    Given It's a set-up site
    When I go to the install page
    Then I should be viewing the homepage 

  @web
  Scenario: Installing a site
    Given It's a fresh site
    When I go to the install page
    And I enter the install form details
    Then I should see a success message

  @web
  Scenario: Messing up while Installing a site
    Given It's a fresh site
    When I go to the install page
    And I enter some install form details
    Then I should see a failure message

  @web
  Scenario: Invalid e-mail address entry
    Given It's a fresh site
    When I go to the install page
    And I enter bad install form details
    Then I should see an error that says: E-mail must be a valid e-mail address


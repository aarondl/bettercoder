@web
Feature: Site installation
  In order to set up the site
  As an administrator
  I want to be able to access the install page

  @web
  Scenario: Accessing the install page on a fresh site
    Given It's a fresh site
    When I go to the install page 
    Then I should see the install page

  @web @important
  Scenario: Accessing the install page on an already set-up site
    Given It's a stale site
    When I go to the install page
    Then I should see the homepage 


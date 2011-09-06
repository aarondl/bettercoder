@web
Feature: Site installation
  In order to set up the site
  As an administrator
  I want to be able to access the install page

  Scenario: Accessing the install page on a fresh site
    When I go to the install page 
    Then I should see the install page


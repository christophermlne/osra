Feature:
  As a site admin for osra
  So that I may maintain the information about osra partners
  I would like to be able to create, read and update partners in the admin section

  Background:
    Given the following partners exist:
      | name          | region      | province                   | province_code |
      | Partner1      | Region1     | Damascus & Rif Dimashq     | 11            |
      | Partner2      | Region2     | Aleppo                     | 12            |
      | Partner3      | Region3     | Homs                       | 13            |
    And I am a new, authenticated user

  Scenario: There should be a link to the partners page on the navbar
    Given I am on the admin dashboard page
    Then I should see "Partners" linking to the admin partners page

  Scenario: There should be a list of partners on the admin index page
    Given I am on the "Partners" page for the "Admin" role
    Then I should see "Partner1"
    And I should see "Partner2"
    And I should see "Partner3"

  Scenario: I should see the generated osra numbers on the admin index page
    Given I am on the "Partners" page for the "Admin" role
    Then I should see the following codes for partners:
      | name       | expected_code  |
      | Partner1   | 11001          |
      | Partner2   | 12001          |
      | Partner3   | 13001          |


  Scenario: Should be able to visit a partner from the partner index page
    Given I am on the "Partners" page for the "Admin" role
    When I click the "Partner1" link 
    Then I should be on the "Show Partner" page for partner "Partner1"

  Scenario: Should be able to add a partner from the partner index page
    Given I am on the "New Partner" page for the "Admin" role
    And I fill in "Name" with "Partner4"
    And I select "Aleppo" from the drop down box for "Province"
    And I fill in "Region" with "Region1"
    And I click the "Create Partner" button
    Then I should be on the "Show Partner" page for partner "Partner4"
    And I should see "Partner was successfully created"
    And I should see "Partner4"

  Scenario: Should be able to edit a partner from the partner show page
    Given I am on the "Show Partner" page for partner "Partner1"
    And I click the "Edit Partner" button
    Then I should be on the "Edit Partner" page for partner "Partner1"
    And I fill in "Region" with "New Region"
    And I click the "Update Partner" button
    Then I should be on the "Show Partner" page for partner "Partner1"
    And I should see "Partner was successfully updated"
    And I should see "New Region"

  Scenario: Should not be able to delete a partner from the partner show page
    Given I am on the "Show Partner" page for partner "Partner1"
    Then I should not see the "Delete Partner" link


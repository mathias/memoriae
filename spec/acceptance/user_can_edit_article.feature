Feature: Editing Articles

  Scenario: User can edit an existing article
    Given an article exists and has been ingested
    And I am logged in
    And I am on the articles page
    When I click the edit article link
    And I change the URL and submit it
    Then I should see the changed URL for that article

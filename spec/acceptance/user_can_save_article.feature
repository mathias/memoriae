Feature: Saving Articles

  Scenario: User can submit new article
    Given I am logged in
    And I am on the articles page
    When I click the add new article link
    And I fill in the new article form
    Then the new article should be captured
    And I should see it in my list of articles

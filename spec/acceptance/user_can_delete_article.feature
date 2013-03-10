Feature: Deleting Articles

  Scenario: User can delete an existing article
    Given an article exists
    And I am logged in
    And I am on the articles page
    When I click the delete article link
    Then I should not see the article in my list of articles

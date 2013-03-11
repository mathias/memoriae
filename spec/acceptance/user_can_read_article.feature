Feature: Reading Articles

  Scenario: User can read article
    Given an article exists and has been ingested
    And I am logged in
    When I am on the articles page
    And I follow the article link
    Then I should see the article details
    And I should see the article body

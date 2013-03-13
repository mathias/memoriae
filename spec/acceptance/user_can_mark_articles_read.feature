Feature: Mark as Read

  Scenario: User sees unread state in list
    Given an ingested article exists
    And I am logged in
    When I visit the articles page
    Then I should see that the article is unread

  Scenario: User can mark article as read
    Given an ingested article exists
    And I am logged in
    When I visit the articles page
    And I follow the article link
    Then I should see that the article is unread
    When I mark the article as read
    Then I should see that the article is read

  Scenario: User can mark article as unread
    Given a read article exists
    And I am logged in
    When I visit the articles page
    And I follow the article link
    Then I should see that the article is read
    When I mark the article as unread
    Then I should see that the article is unread

  Scenario: User can mark all articles as read
    Given 2 ingested articles exist
    And I am logged in
    When I visit the articles page
    Then I should see that both articles are unread
    When I mark all articles as read
    Then I should see that both articles are read

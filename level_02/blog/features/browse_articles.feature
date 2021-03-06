Feature: Browse articles
  So that I can browse through the articles
  As a visitor
  I want to be able to see choose an article from a full list of articles and read it

  Scenario: Browsing a list of articles
    Given an article with the title "the answer to the question of life"
    And an article with the title "why 42 is the new pink"
    When I am on the articles page
    Then I should see "the answer to the question of life"
    And I should see "why 42 is the new pink"

  Scenario: Reading an article
    Given an article with the title "the answer to the question of life" and the content "is 42"
    When I am on the articles page
    And I follow "the answer to the question of life"
    Then I should see "the answer to the question of life"
    And I should see "is 42"
    And I should see "Back to articles"

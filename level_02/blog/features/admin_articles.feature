Feature: Administer articles
  So that I can manage articles
  As an admin
  I want to be able to add, delete and edit articles

  Scenario: Adding an article
    Given there is no article with the title "Hello world!"
    And I am on the articles page
    When I follow "Add article"
    And I fill in "Title" with "Hello world!"
    And I fill in "Content" with "spam spam spam"
    And I press "Submit"
    Then I should be on the article show page for "Hello world!"
    And I should see "Article saved successfully!"
    And I should see "Hello world!"
    And I should see "spam spam spam"
    And I should see "Back to articles"
    And I should see "Hello world!" on the articles list

  Scenario: Adding an article with a duplicate title
    Given an article with the title "Hello world!"
    And I am on the articles page
    When I follow "Add article"
    And I fill in "Title" with "Hello world!"
    And I press "Submit"
    And I should not see "Article saved successfully!"

  Scenario: Adding an article without a title
    Given I am on the articles page
    When I follow "Add article"
    And I press "Submit"
    Then I should not see "Article saved successfully!"

  Scenario: Deleting an article
    Given an article with the title "Hello world!"
    And I am on the articles page
    When I follow "Hello world!"
    And I follow "Destroy"
    Then I should be on the articles page
    And I should not see "Hello world!"

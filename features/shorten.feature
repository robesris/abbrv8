Feature: Url Shortening
As a user
In order not not have my friends get annoyed at me
I want to send them short urls instead of long onces

Scenario: User shortens a url successfully
  Given I am on the homepage
  And I try to shorten "http://www.asheavenue.com"
  Then I should get a short url
  And that url should lead to the original url
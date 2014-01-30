Feature: Url Shortening
As a user
In order not not have my friends get annoyed at me
I want to send them short urls instead of long onces

Scenario: User shortens a valid http url successfully
  Given I am on the homepage
  And I try to shorten "http://www.asheavenue.com"
  Then I should get a short url
  And that url should lead to the original url

Scenario: User shortens a valid https url successfully
  Given I am on the homepage
  And I try to shorten "https://facebook.com"
  Then I should get a short url
  And that url should lead to the original url

Scenario: User shortens a valid url without the http successfully
  Given I am on the homepage
  And I try to shorten "www.google.com"
  Then I should get a short url
  And that url should lead to the original url

Scenario: User tries to shorten an invalid url
  Given I am on the homepage
  And I try to shorten "www.notaurl"
  Then I should not get a short url
  And I should see an error message
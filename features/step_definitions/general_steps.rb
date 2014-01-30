Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I try to shorten "(.*?)"$/) do |long_url|
  fill_in :abbrv8_url_long_url, with: long_url
  click_on "Shorten"
end

Then(/^I should get a short url$/) do
  short_url_section = find('#short-url')
  short_url_section.should have_content(/http:\/\/.*\/[0-9A-Za-z]{5}$/)
end

Then(/^that url should lead to the original url$/) do
  pending # express the regexp above with the code you wish you had
end
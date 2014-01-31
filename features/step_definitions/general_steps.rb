Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I try to shorten "(.*?)"$/) do |long_url|
  unless long_url[0..6] == "http://" || long_url[0..7] == "https://"
    long_url = "http://" + long_url
  end
  @long_url = long_url
  fill_in :abbrv8_url_long_url, with: long_url
  click_on "Shorten"
end

Then(/^I should get a short url$/) do
  short_url_section = find('#short-url')
  short_url_section.should have_content(/http:\/\/.*\/[0-9A-Za-z]{5}$/)
  @short_url = short_url_section.text.strip
end

Then(/^that url should lead to the original url$/) do
  abbrv8_url = Abbrv8Url.where(short_url: @short_url.split('/').last).first
  expect(abbrv8_url.long_url).to eq(@long_url)
end

Then(/^I should not get a short url$/) do
  expect(find('#short-url').text).to be_blank
end

Then(/^I should see an error message$/) do
  expect(find('#errors').text).to_not be_blank
end

When(/^I visit the short url$/) do
  visit @short_url
end

Then(/^I should be on "(.*?)"$/) do |url|
  URI.parse(current_url).host.should == url
end

When(/^I visit the stats page$/) do
  visit stats_url
end

Then(/^I should see (\d+) visits? to the short url$/) do |num|
  expect(page).to have_content(/#{@short_url.split("/").last}.*#{num}/)
end


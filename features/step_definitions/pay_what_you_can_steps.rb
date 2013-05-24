Given(/^I am on the pay what you can page$/) do
  visit contributions_path
end

When(/^I choose a monthly contribution of \$(\d+)$/) do |arg1|
  click_on '$2'
end

When(/^I choose a once\-off contribution of \$(\d+)$/) do |arg1|
  click_on '$10'
end

When(/^I visit the pay what you can page$/) do
  visit contributions_path
end

Then(/^I be should be redirected to the sign in page$/) do
  page.should have_css '.sessions.new'
end
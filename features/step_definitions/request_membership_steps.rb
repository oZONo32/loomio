When(/^I fill in and submit the Request membership form$/) do
  fill_in 'membership_request_name', with: "John d'Wayne"
  fill_in 'membership_request_email', with: "John.d'Wayne@gmail.com"
  fill_in 'membership_request_introduction', with: "Please add me to your group, it seems like the best decission making forum ever."
  click_on "Request membership"
end

When(/^fill in and submit the Request membership form \(introduction only\)$/) do
  fill_in 'membership_request_introduction', with: "Please add me to your group, it seems like the best decission making forum ever."
  click_on "Request membership"
end

Then(/^I should see a flash message confirming my membership request$/) do
  find('.alert-success').should have_content('Membership requested')
end

Then(/^I should see a flash message confirming the membership request was approved$/) do
  find('.alert-success').should have_content('Request approved')
end

Given(/^there is a membership request from a signed\-out user$/) do
  @membership_request = FactoryGirl.create :membership_request
  @group = @membership_request.group
end

Given(/^there is a membership request from a signed\-in user$/) do
  step 'there is a membership request from a signed-out user'
  @membership_request.user = FactoryGirl.create :user
  @membership_request.save
end

Given(/^I am a logged in coordinator of the group$/) do
  @admin = @group.admins.first
  login @admin
end

When(/^I approve the membership request$/) do
  visit group_membership_requests_path(@group)
  click_on "approve-membership-request-#{@membership_request.id}"
  # click_on "confirm-action"
end


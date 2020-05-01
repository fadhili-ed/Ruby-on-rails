# frozen_string_literal: true

Given('I am on the signup page') do
  visit 'users/new'
end

Then('I should see {string}') do |string|
  expect(page).to have_content string
end

Then('I should see {string} button') do |string|
  expect(page).to have_button string
end

When('I fill in {string} with {string}') do |string, string2|
  fill_in string, with: string2
end

When('I click Create Account') do
  click_button('Create Account')
end
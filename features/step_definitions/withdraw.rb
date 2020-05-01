# frozen_string_literal: true

Given('I am on the widrawals page') do
  visit 'withdrawals/new'
end

When('I click Withdraw') do
  click_button('Withdraw')
end

Then('I should be redirected show my withdrawal') do
  withdraw = Withdraw.find_by(id_number: '12345678')
  withdraw_id = withdraw.id
  visit "/withdrawals/#{withdraw_id}"
end

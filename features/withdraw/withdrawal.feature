Feature: Withdrawals
As a user
I want to withdraw
So that i can use my money

Scenario: User successfully withdraws
Given I am on the widrawals page
Then I should see "Amount"
And I should see "Pin"
And I should see "Id number"
And I should see "Withdraw" button
When I fill in "Amount" with "500"
And I fill in "Pin" with "1234"
And I fill in "Id number" with "12345678"
And I click Withdraw
Then I should be redirected show my withdrawal
And I should see "Id number: 12345678"
And I should see "Withdrawal: 500"


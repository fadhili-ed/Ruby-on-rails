Feature: User Deposit
As a User
I want to deposit
So that i can see my balance

Scenario: User successfully deposits
Given I am on the deposit page
Then I should see "First name"
And I should see "Last name"
And I should see "Deposits"
And I should see "Deposit Amount" button
When I fill in "First name" with "Luke"
And I fill in "Last name" with "Loot"
And I fill in "Deposits" with "123456"
And I click Deposit Amount
Then I should be redirected to show page
Then I should see "First name: Luke"
Then I should see "Last name: Loot"
Then I should see "Balance: 123456"

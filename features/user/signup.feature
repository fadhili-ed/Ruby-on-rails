
Feature: User Sign Up
As a User
I want to sign up
So that I can have an account

Scenario: User successfully signup
Given I am on the signup page
Then I should see "First name"
And I should see "Last name"
And I should see "Id number"
And I should see "Phone number"
And I should see "Password"
And I should see "Create Account" button
When I fill in "First name" with "Jane"
And I fill in "Last name" with "Doe"
And I fill in "Id number" with "12345678"
And I fill in "Phone number" with "070000000000"
And I fill in "Password" with "StrongerthanUsual"
And I click Create Account
Then I should see "First name: Jane"
And I should see "Last name: Doe"
And I should see "Id number: 12345678"
And I should see "Phone number: 070000000000"
And I should see "Pin: 1234"
And I should see "Balance: 0.0"

Scenario: User sees errors with invalid inputs
Given I am on the signup page
When I fill in "First name" with "Jane"
Then I fill in "Last name" with "Doe"
Then I fill in "Id number" with "12455682"
Then I click Create Account
Then I should see "Password is too short"
And I should see "Phone number is too short"
Then I should see "Password can't be blank"
Then I should see "Phone number can't be blank"
Then I should see "Phone number should be digits only"
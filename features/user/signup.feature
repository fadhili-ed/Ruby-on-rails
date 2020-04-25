
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
And I fill in "Password" with "Stronger*than123Usual"
And I click Create Account
Then I shoud be redirect to show page
And I should see "First name: Jane"
And I should see "Last name: Doe"
And I should see "Id number: 12345678"
And I should see "Phone number: 070000000000"
And I should see "Pin: 1234"
And I should see "Balance: 0.0"
Feature: Sending money
As a user 
I want to send money

Scenario: User is able to send
Given I am on the sending page
Then I should see "Sender phone number"
And I should see "Sender id number"
And I should see "Recepient phone number"
And I should see "Pin"
And i should see "Amount"
And I should see "Send" button
When I fill in "Sender phone number" with "0722564897"
And I fill in "Sender id number" with "02654225"
And I fill  in "Recepient phone number" with "0748967856"
And I fill in "Pin" with "1234"
And I fill in "Amount" with "5233"
And I click Send
Then I should be redirected to the show page
Then I should see "Phone number: 0722564897 "
Then I should see "Id number: 02654225"
Then I should see "Recepient phone number: 0748967856"
Then I should see "Amount: 5233"
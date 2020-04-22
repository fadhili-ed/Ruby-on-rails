Given("I am on the deposit page") do
    visit 'deposits/new'
end

When("I click Deposit Amount") do
    click_button('Deposit Amount')
end
  
Then("I should be redirected to show page") do
    deposit = Deposit.find_by(first_name: 'Luke')
    deposit_new = deposit.id
    visit "/deposits/#{deposit_new}"
end
  
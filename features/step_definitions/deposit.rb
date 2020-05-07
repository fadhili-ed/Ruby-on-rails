Given("I am on the deposit page") do
    visit 'deposits/new'
end

When("I click Deposit Amount") do
    click_button('Deposit Amount')
end
  
Given("I am on the sending page") do
    visit 'send/new'
  end
  
  Then("i should see {string}") do |string|
    expect(page).to have_content string
  end
  
  When("I fill  in {string} with {string}") do |string, string2|
    fill_in string, with: string2
  end
  
  When("I click Send") do
    click_button('Send')
  end
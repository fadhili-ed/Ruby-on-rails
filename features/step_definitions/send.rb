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
  
  Then("I should be redirected to the show page") do
    send = Send.find_by(sender_id_number: "234587")
    send_id = send.id
    visit "/send/#{send_id}"
  end
require 'rails_helper'

feature 'User can search for the closest fuel stations' do 
  scenario 'they can search via zip code' do 
    zip_code = 80203
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    # And I click "Locate"
    fill_in :q, with: zip_code
    click_on 'Locate'
    # Then I should be on page "/search"
    expect(current_path).to eq('/search')
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    expect(page).to have_css('.station', count: 10)
    within(first('station')) do 
      expect(page).to have_css('.name')
      expect(page).to have_css('.address')
      expect(page).to have_css('.fuel_types')
      expect(page).to have_css('.distance')
      expect(page).to have_css('.access_times')
    end
    expect(page).to have_content()
    expect(page).to have_content()
    expect(page).to have_content()
    expect(page).to have_content()
    expect(page).to have_content()
  end 
end 


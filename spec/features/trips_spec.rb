require 'spec_helper'

feature 'Trips' do
  scenario 'make a trip search' do

    visit root_path
    find(:css, '#go_like').set(true)   #click on the checkbox
    click_button 'Show me'
    expect(page).to have_content 'Result'


  end

end
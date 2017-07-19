require "rails_helper"

feature "Search", :type => :feature do
  scenario "User creates a new search" do
    visit "/"

    fill_in "Term", :with => "Test search"
    click_button "Search"

    expect(page).to have_text("Test search")
  end
end
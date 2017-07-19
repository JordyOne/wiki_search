require "rails_helper"

feature "Search", :type => :feature do
  scenario "User creates a new search" do
    visit "/"

    fill_in "Term", :with => "Test search"
    click_button "Search"

    expect(page).to have_text("Test search")
  end

  scenario "User is viewing existing search" do
    search_term = SearchTerm.new(term: "Test search")
    visit search_term_path(search_term)

    expect(page).to have_selector("h1", text: search_term.term)

    fill_in "Term", :with => "Another Test search"
    click_button "Search"

    expect(page).to have_text("Another Test search")
  end
end
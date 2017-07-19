require "rails_helper"

feature "Search", :type => :feature do
  scenario "User creates a new search" do
    visit "/"

    fill_in "Term", :with => "Test search"
    click_button "Search"

    expect(page).to have_text("Test search")
  end

  scenario "User is viewing existing search" do
    search_term = SearchTerm.create(term: "Test search")
    visit search_term_path(search_term)

    expect(page).to have_selector("h1", text: search_term.term)

    fill_in "Term", :with => "Another Test search"
    click_button "Search"

    expect(page).to have_text("Another Test search")
  end


  context "previous searches exist" do
    scenario "User is viewing sidebar" do
      search_term_1 = SearchTerm.create(term: "Test search 1")
      search_term_2 = SearchTerm.create(term: "Test search 2")
      search_term_3 = SearchTerm.create(term: "Test search 3")
      search_term_4 = SearchTerm.create(term: "Test search 4")
      visit search_term_path(search_term_1)

      within("#sidebar-wrapper") do
        expect(page).to have_selector(".sidebar-brand a", text: "Previous Searches")

        expect(page).to have_selector("a", text: search_term_1.term)
        expect(page).to have_selector("a", text: search_term_2.term)
        expect(page).to have_selector("a", text: search_term_3.term)
        expect(page).to have_selector("a", text: search_term_4.term)
      end
    end
  end
end
require "rails_helper"

feature 'User can destroy vacancy', %q{
  In order to actualize existing list.
} do

  given!(:vacancy) { create(:vacancy) }

  scenario "deletes vacancy" do
    visit vacancy_path(vacancy)
    find("a", text: "Delete").click
    expect(page).to have_content("Vacancy was successfully destroyed")
    expect(page).to have_no_content(vacancy.title)
  end
end
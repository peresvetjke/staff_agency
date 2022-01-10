require "rails_helper"

feature 'User can edit a vacancy', %q{
  In order to correct or update it
} do

  given!(:vacancy) { create(:vacancy) }

  background {
    visit vacancy_path(vacancy)
    find("a", text: "Edit").click
  }

  scenario "tries to update with invalid values" do
    fill_in "Title", :with => ""
    click_button "Update Vacancy"
    expect(page).to have_content("Error ocurred:")
    expect(page).to have_text("Title can't be blank")
  end

  scenario "updates vacancy" do
    fill_in "Title", :with => "New title"
    click_button "Update Vacancy"
    expect(page).to have_content("Vacancy was successfully updated.")
    expect(page).to have_text("New title")
  end
end
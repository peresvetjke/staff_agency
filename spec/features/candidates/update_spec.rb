require "rails_helper"

feature 'User can edit a candidate', %q{
  In order to correct or update its profile
} do

  given!(:candidate) { create(:candidate) }

  background {
    visit candidate_path(candidate)
    find("a", text: "Edit").click
  }

  scenario "tries to update with invalid values" do
    fill_in "Surname", :with => ""
    click_button "Update Candidate"

    expect(page).to have_text("Surname can't be blank")
  end

  scenario "updates candidate" do
    fill_in "Email", :with => "new_email@example.com"
    click_button "Update Candidate"

    expect(page).to have_content("Candidate was successfully updated.")
    expect(page).to have_text("new_email@example.com")
  end
end
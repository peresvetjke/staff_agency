require "rails_helper"

feature 'User can destroy candidate', %q{
  In order to actualize existing list.
} do

  given!(:candidate) { create(:candidate) }

  scenario "deletes candidate" do
    visit candidate_path(candidate)
    find("a", text: "Delete").click
    expect(page).to have_content("Candidate was successfully destroyed")
    expect(page).to have_no_content(candidate.surname)
  end
end
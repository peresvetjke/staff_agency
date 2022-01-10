require "sphinx_helper"

feature 'User can update existing skill list', %q{
  In order to correct or actualize profile
}, js: true, sphinx: true do

  given!(:vacancy)   { create(:vacancy) }
  given!(:candidate) { create(:candidate) }

  scenario "when updating a vacancy" do
    visit edit_vacancy_path(vacancy)
    find("#skills > li", text: vacancy.skill_list.first).click
    click_button "Update Vacancy"
    expect(page).to have_text("Vacancy was successfully updated")
    expect(page).to have_no_content(vacancy.skill_list.first)
  end

  scenario "when updating a candidate" do
    visit edit_candidate_path(candidate)
    find("#skills > li", text: candidate.skill_list.first).click
    click_button "Update Candidate"
    expect(page).to have_text("Candidate was successfully updated")
    expect(page).to have_no_content(candidate.skill_list.first)
  end
end

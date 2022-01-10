require "rails_helper"

feature 'User can view candidate', %q{
  In order to check its profile details
} do

  given(:candidate)       { create(:candidate) }
  
  scenario "views candidate and see its profile details" do
    visit candidate_path(candidate)
    expect(page).to have_content(candidate.surname)
    expect(page).to have_content(candidate.name)
    expect(page).to have_content(candidate.middle_name)
    expect(page).to have_content(candidate.desired_salary)
    expect(page).to have_content(candidate.contact_number)
    expect(page).to have_content(candidate.email)
    expect(page).to have_content(candidate.skill_list.first)
  end
end
require "sphinx_helper"

feature 'User can select existing skill from list', %q{
  In order to classify candidates and vacancies
  And to minimize duplications in maintained skills
}, js: true, sphinx: true do

  given!(:vacancy) { create(:vacancy) }

  scenario "when creating a vacancy" do
    visit new_vacancy_path
    fill_in "Title", :with => "New vacancy"
    fill_in "Salary", :with => "10000"
    fill_in "Phone number", :with => "9998887766"
    fill_in "Email", :with => "hh@example.com"
    fill_in "Expiration date", :with => Time.now + 25.days
    fill_in  "skill", :with => vacancy.skill_list.first
    find("#search_results > li", visible: :all, text: vacancy.skill_list.first).click
    click_button "Create Vacancy"
    
    expect(page).to have_text("Vacancy was successfully created")
    expect(page).to have_content(vacancy.skill_list.first)
  end

  scenario "when creating a candidate" do
    visit new_candidate_path
    fill_in "Surname", :with => "Смирнов"
    fill_in "Name", :with => "Афанасий"
    fill_in "Middle name", :with => "Кириллович"
    fill_in "Desired salary", :with => "10000"
    fill_in "Phone number", :with => "9998887766"
    fill_in "Email", :with => "smirnov@example.com"
    fill_in  "skill", :with => vacancy.skill_list.first
    find("#search_results > li", visible: :all, text: vacancy.skill_list.first).click
    click_button "Create Candidate"

    expect(page).to have_text("Candidate was successfully created")
    expect(page).to have_content(vacancy.skill_list.first)
  end
end

require "sphinx_helper"

feature 'User can create a vacancy', %q{
  In order to find potential employee
}, js: true, sphinx: true do

  background {
    visit vacancies_path
    find("a", text: "Add vacancy").click
  }

  scenario "tries to create vacancy with blank fields" do
    click_button "Create Vacancy"

    expect(page).to have_content("Errors ocurred:")
    expect(page).to have_text("Title can't be blank")
    expect(page).to have_text("Phone number can't be blank")
    expect(page).to have_text("Expiration date can't be blank")
    expect(page).to have_text("Salary can't be blank")
    expect(page).to have_text("Skill list can't be blank")
  end

  scenario "creates vacancy" do
    fill_in "Title", :with => "New vacancy"
    fill_in "Salary", :with => "10000"
    fill_in "Phone number", :with => "9998887766"
    fill_in "Email", :with => "hh@example.com"
    fill_in "Expiration date", :with => Time.now + 25.days
    fill_in "skill", :with => "new skill"
    find("#add_skill").click
    click_button "Create Vacancy"

    expect(page).to have_text("Vacancy was successfully created")
    expect(page).to have_content("New vacancy")
  end
end

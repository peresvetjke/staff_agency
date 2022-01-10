require "sphinx_helper"

feature 'User can create a candidate', %q{
  In order to find and close matching vacancy
}, js: true, sphinx: true do

  background {
    visit candidates_path
    find("a", text: "Add candidate").click
  }

  scenario "tries to create candidate with blank fields" do
    click_button "Create Candidate"
    
    expect(page).to have_text("Errors ocurred:")
    expect(page).to have_text("Name can't be blank")
    expect(page).to have_text("Surname can't be blank")
    expect(page).to have_text("Middle name can't be blank")
    expect(page).to have_text("Desired salary can't be blank")
    expect(page).to have_text("Phone number can't be blank")
    expect(page).to have_text("Email can't be blank")
    expect(page).to have_text("Skill list can't be blank")
  end

  scenario "creates candidate" do
    fill_in "Surname", :with => "Смирнов"
    fill_in "Name", :with => "Афанасий"
    fill_in "Middle name", :with => "Кириллович"
    fill_in "Desired salary", :with => "10000"
    fill_in "Phone number", :with => "9998887766"
    fill_in "Email", :with => "smirnov@example.com"
    fill_in "skill", :with => "new skill"
    find("#add_skill").click
    click_button "Create Candidate"

    expect(page).to have_text("Candidate was successfully created")
    expect(page).to have_content("Смирнов Афанасий Кириллович")
  end
end

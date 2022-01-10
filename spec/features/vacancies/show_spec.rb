require "rails_helper"

feature 'User can view vacancy', %q{
  In order to check its details
} do

  given(:vacancy)       { create(:vacancy) }
  
  scenario "views vacancy and see its details" do
    visit vacancy_path(vacancy)
    expect(page).to have_content(vacancy.title)
    expect(page).to have_content(vacancy.expiration_date)
    expect(page).to have_content(vacancy.salary)
    expect(page).to have_content(vacancy.contact_number)
    expect(page).to have_content(vacancy.email)
  end
end
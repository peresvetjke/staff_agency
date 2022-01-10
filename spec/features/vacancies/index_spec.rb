require "rails_helper"

feature 'User can index all vacancies list', %q{
  In order to find the one he interested in
} do

  scenario "without vacancies" do
    visit vacancies_path
    expect(page).to have_text("No vacancies yet")
  end

  scenario "with few vacancies" do
    vacancies = create_list(:vacancy, 5)
    visit vacancies_path
    expect(page).to satisfy("has all vacancies") { |page| page.all('tr.vacancy').count == 5 && vacancies.all? { |v| page.has_content?(v.title) } }
  end
end
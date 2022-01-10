require "rails_helper"

feature 'User can index all candidates list', %q{
  In order to find the one he interested in
} do

  scenario "without candidates" do
    visit candidates_path
    expect(page).to have_text("No candidates yet")
  end

  scenario "with few candidates" do
    candidates = create_list(:candidate, 5)
    visit candidates_path
    expect(page).to satisfy("has all candidates") { |page| page.all('tr.candidate').count == 5 && candidates.all? { |c| page.has_content?(c.surname) } }
  end
end
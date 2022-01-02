require "rails_helper"

RSpec.describe VacanciesController, type: :controller do
  let(:vacancy) { build(:vacancy) }

  describe "POST create" do
    subject { post :create, params: { vacancy: attributes_for(:vacancy).merge({skill_list: "north, east, south, west"}) } }

    it "redirects to vacancy" do
      subject
      expect(response).to redirect_to(assigns(:vacancy))
    end

    it "creates new record" do
      expect{subject}.to change(Vacancy, :count).by(1)
    end

    it "creates new record" do
      subject
      expect(Vacancy.count).to eq 1
      expect(Vacancy.last.skill_list).to match_array(%w[north east south west])
    end
  end
end
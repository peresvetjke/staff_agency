require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  describe 'validations' do
    let!(:vacancy) { create(:vacancy) }

    it_behaves_like "contactable" do
      let(:contactable) { :vacancy }
    end

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:expiration_date) }
    it { should validate_presence_of(:salary) }
    it { should validate_presence_of(:skill_list) }
  end  
end

require 'rails_helper'

RSpec.describe Candidate, type: :model do
  describe 'validations' do
    let!(:candidate) { create(:candidate) }

    # it_behaves_like "skillable"
    it_behaves_like "contactable" do
      let(:contactable) { :candidate }
    end

    it "full name should consist of 3 words, only cyrillic chars and spaces" do
      should_not allow_value("test@").for(:name)
      should_not allow_value("test@").for(:middle_name)
      should_not allow_value("test@").for(:surname)
      expect(candidate.full_name).to eq "#{candidate.surname} #{candidate.name} #{candidate.middle_name}"
    end

    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:desired_salary) }
    it { should validate_presence_of(:skill_list) }
  end  
end

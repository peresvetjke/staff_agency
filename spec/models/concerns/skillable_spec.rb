require "rails_helper"

shared_examples_for "skillable" do
  describe 'associations' do
    it { should have_many(:assigned_skills).dependent(:destroy) }
    it { should have_many(:skills).through(:assigned_skills) }
  end
end
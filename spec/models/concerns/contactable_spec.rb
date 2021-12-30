require "rails_helper"

shared_examples_for "contactable" do
  it "contact info should contain either valid phone number or email" do
    should_not allow_value("test@").for(:phone_number)
    should_not allow_value("test@").for(:email)
    expect(build(contactable, phone_number: nil, email: nil)).to be_invalid
  end
end
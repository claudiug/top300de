require 'spec_helper'


describe "Feedback " do

  it "is valid with name, email, is_active, comment, pro, contra" do
    expect(build(:feedback)).to be_valid
  end
  it "is invalid without an name" do
    expect(build(:feedback,  name:nil)).to have(1).errors_on(:name)
  end
  it "is invalid without an email" do
    expect(build(:feedback, email:nil)).to have(1).errors_on(:email)
  end
  it "must have is_active set on false after save" do
     f = create(:feedback)
    expect(f.is_active).to eq false
  end
  it "is invalid without a comment" do
    expect(build(:feedback, comment:nil)).to have(1).errors_on(:comment)
  end
end
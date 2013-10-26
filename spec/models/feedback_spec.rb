require 'spec_helper'


describe "Feedback " do

  it "is valid with name, email, is_active, comment, pro, contra"
  it "is invalid without an name"
  it "is invalid without an email"
  it "must have is_active set on false after save"
  it "is invalid without a comment"
end
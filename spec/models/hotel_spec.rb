require 'spec_helper'

describe "Hotel" do

  it "is valid with: name, address, rating, phone_number, email, web_page, is_active"
  it "is invalid without name"
  it "is invalid without address"
  it "is invalid without rating"
  it "is invalid without phone_number"
  it "is invalid without email"
  it "is invalid without web_page"
  it "is invalid without is_active"
  it 'must have the slug uniq'
  it 'must have the name uniq'
  it 'must have the name titlecase'

end
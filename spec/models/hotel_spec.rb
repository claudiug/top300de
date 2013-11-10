require 'spec_helper'

describe "Hotel" do

  it "is valid with: name, address, rating, phone_number, email, web_page, is_active" do
    expect(build(:hotel)).to be_valid
  end
  it "is invalid without name"  do
    expect(build(:hotel, name:nil)).to have(1).errors_on(:name)
  end
  it "is invalid without address" do
    expect(build(:hotel, address:nil)).to have(1).errors_on(:address)
  end
  it "is invalid without rating" do
    expect(build(:hotel, rating:nil)).to have(2).errors_on(:rating)
  end
  it "is invalid without phone_number" do
    expect(build(:hotel, phone_number:nil)).to have(1).errors_on(:phone_number)
  end
  it "is invalid without email" do
    expect(build(:hotel, email:nil)).to have(1).errors_on(:email)
  end
  it "is invalid without web_page" do
    expect(build(:hotel, web_page:nil)).to have(1).errors_on(:web_page)
  end
  it "is invalid without is_active" do
    expect(build(:hotel, is_active:nil)).to have(1).errors_on(:is_active)
  end

  it 'must have the name uniq' do
    create(:hotel, name:"demo")
    hotel = build(:hotel, name:"demo")
    expect(hotel).to have(1).errors_on(:name)
  end
  it 'must have the name titlecase' do
    hotel=create(:hotel, name:"demo")
    expect(hotel.name).to eq "demo".titlecase
  end

end
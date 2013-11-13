require 'spec_helper'


describe "Restaurant" do


  it 'is valid with: name, address, email , phone_number, is_active, web_page' do
    expect(create(:restaurant)).to be_valid
  end
  it 'is invalid without name' do
    expect(build(:restaurant, name: nil)).to have(1).errors_on(:name)
  end
  it 'is invalid without address' do
    expect(build(:restaurant, address: nil)).to have(1).errors_on(:address)
  end
  it 'is invalid without email' do
    expect(build(:restaurant, email: nil)).to have(1).errors_on(:email)
  end
  it 'is invalid without phone_number' do
    expect(build(:restaurant, phone_number: nil)).to have(1).errors_on(:phone_number)
  end
  it 'is invalid without is_active' do
    expect(build(:restaurant, is_active: nil)).to have(1).errors_on(:is_active)
  end
  it 'is invalid without webpage' do
    expect(build(:restaurant, web_page: nil)).to have(1).errors_on(:web_page)
  end

end
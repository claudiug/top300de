require 'spec_helper'

describe "Trip" do

  it 'is valid with : name, city, zip_code, description, is_active' do
    expect(build(:trip)).to be_valid
  end
  it 'is invalid without name' do
    expect(build(:trip, name: nil)).to have(1).errors_on(:name)
  end
  it 'is invalid without city'
  it 'is invalid without zip_code'
  it 'is invalid without zip_description'
  it 'is invalid without is_active'

end
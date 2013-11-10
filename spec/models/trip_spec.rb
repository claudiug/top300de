require 'spec_helper'

describe "Trip" do

  it 'is valid with : name, city, zip_code, description, is_active' do
    expect(build(:trip)).to be_valid
  end
  it 'is invalid without name' do
    expect(build(:trip, name: nil)).to have(1).errors_on(:name)
  end
  it 'is invalid without city' do
    expect(build(:trip, city: nil)).to have(1).errors_on(:city)
  end
  it 'is invalid without zip_code'  do
    expect(build(:trip, zip_code: nil)).to have(1).errors_on(:zip_code)
  end
  it 'is invalid without description' do
    expect(build(:trip, description: nil)).to have(1).errors_on(:description)
  end
  it 'is invalid without is_active'  do
    expect(build(:trip, is_active: nil)).to have(1).errors_on(:is_active)

  end

end
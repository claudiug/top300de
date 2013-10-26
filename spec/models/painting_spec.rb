require 'spec_helper'

describe "Painting" do

  it 'is valid with: name, is_feature, is_active, image' do
    expect(build(:painting)).to be_valid
  end

  it 'is invalid without a name'
  it 'is invalid without a image'
  it 'is invalid without is_feature'
  it 'is invalid without is_active'

end
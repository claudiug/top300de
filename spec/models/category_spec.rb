require 'spec_helper'

describe 'Category' do


  it 'has a valid Factory' do
    expect(build(:category)).to be_valid
end
  
  

  it 'is valid with: name, is_active seo description' do
    expect(build(:category)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:category, name: nil)).to have(1).errors_on(:name)
  end
  it 'is invalid without is_active' do
    expect(build(:category, is_active:nil)).to have(1).errors_on(:is_active)
  end
  it "is invalid without seo" do
    expect(build(:category, seo:nil)).to have(1).errors_on(:seo)
  end
  it 'is invalid without description' do
    expect(build(:category, description:nil)).to have(1).errors_on(:description)
  end
  it 'is invalid with a duplicate name' do
    create(:category, name: "cate1")
    category = build(:category, name: "cate1")
    expect(category).to have(1).errors_on(:name)
  end
  it 'is invalid with a duplicate slug' do
    create(:category, name:"demo")
    category = build(:category,name:"demo")
    expect(category).to have(1).errors_on(:slug)
  end
  it 'is valid with name titlecase' do
    cat=create(:category, name:"demo")
    expect(cat.name).to eq "demo".titlecase
  end

end
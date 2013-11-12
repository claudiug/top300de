require 'spec_helper'

describe "User" do

  it 'is valid with: name, email, password, password_confirmation, is_admin' do
    expect(create(:user)).to be_valid

  end
  it 'is invalid with name' do
    expect(build(:user, name:nil)).to have(1).errors_on(:name)
  end
  it 'is invalid with email' do
    expect(build(:user, email:nil)).to have(1).errors_on(:email)
  end
  it 'is invalid with password'do
    expect(build(:user, password:nil)).to have(2).errors_on(:password)
  end
  it 'is invalid with password confirmation' do
    expect(build(:user, password_confirmation:nil)).to have(1).errors_on(:password_confirmation)
  end
  it 'is set by default is_admin to false' do
    user =  create(:user)
    expect(user.is_admin).to eq false
  end
  it 'has the name uniq'
  it 'has the name email'


end
require 'spec_helper'

describe "User" do

  it 'is valid with: name, email, password, password_confirmation, is_admin'
  it 'is invalid with name'
  it 'is invalid with email'
  it 'is invalid with password'
  it 'is invalid with password digest'
  it 'is set by default is_admin to false'
  it 'has the name uniq'
  it 'has the name email'


end
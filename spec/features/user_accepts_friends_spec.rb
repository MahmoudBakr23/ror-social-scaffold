require 'rails_helper'

RSpec.feature "UserAcceptsFriends", type: :feature do
  before(:each) do
    @user_1 = User.create!(name:"user_1",email:"user_1@mail.com",password:"password")
    @user_2 = User.create!(name:"user_2",email:"user_2@mail.com",password:"password")
    visit '/users/sign_in'
    fill_in 'Email', with: "user_1@mail.com"
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit users_path
    click_link 'Add Friend'
    click_link 'Sign out'
    fill_in 'Email', with: "user_2@mail.com"
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit users_path
  end

  
  it "checks user out" do
    expect(page).to have_link('Accept') 
  end
  
  it "description" do
    click_link 'Accept'
    expect(@user_1.friend?(@user_2)).to eq(true)
  end

  it "description" do
    click_link 'Cancel'
    expect(@user_1.friend?(@user_2)).to eq(false)
  end
  
end

require 'rails_helper'

RSpec.feature "UserInvitesFriends", type: :feature do
   before(:each) do
     @user_1 = User.create!(name:"user_1",email:"user_1@mail.com",password:"password")
     @user_2 = User.create!(name:"user_2",email:"user_2@mail.com",password:"password")
     visit '/users/sign_in'
     fill_in 'Email', with: "user_1@mail.com"
     fill_in 'Password', with: 'password'
     click_button 'Log in'
   end

   it 'visits all users page' do
    visit users_path
    expect(page).to have_text('user_1')
    expect(page).to have_link('See Profile')
  end

  it 'checks users have an add friend button' do
    visit users_path
    expect(page).to have_text('user_1')
    expect(page).to have_link('Add Friend')
  end

  it 'checks users have an add friend button' do
    visit users_path
    expect(page).to have_text('user_1')
    expect(page).to have_link('Add Friend')
    click_link 'Add Friend'
    expect(@user_2.friend_requests.count).to eq(1)
  end


end

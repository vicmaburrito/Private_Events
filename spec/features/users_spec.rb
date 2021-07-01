require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    scenario 'should be successful' do
      visit new_user_registration_path
      within('form') do
        fill_in 'Username', with: 'Klaus'
        fill_in 'Email', with: 'Klaus@email.com'
        fill_in 'Password', with: 1234567
        fill_in 'Password confirmation', with: 1234567
      end
      click_button 'Sign up'
      expect(current_path).to eq(root_path)
    end
    scenario 'should be failure' do
      visit new_user_registration_path
      within('form') do
        fill_in 'Username', with: 'Klaus'
        fill_in 'Password', with: 1234567
        fill_in 'Password confirmation', with: 1234567
      end
      click_button 'Sign up'
      expect(current_path).not_to eq(root_path)
    end
  end
end
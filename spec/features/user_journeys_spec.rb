require 'rails_helper'

RSpec.feature 'User journeys', type: :feature do
  describe "User can signup" do
    let(:user_email) { 'test@test.com' }
    let(:user_username) { 'test1' }
    let(:user_password) { 'SuPeRsecure343t'}

    before(:each) do
      visit '/users/sign_up'
    end

    it "Gets to signup page" do
      expect(page).to have_content "Sign up"
    end

    it "User can signup" do
      fill_in 'user_email', with: user_email
      fill_in 'user_username', with: user_username
      fill_in 'user_password', with: user_password
      fill_in 'user_password_confirmation', with: user_password
      click_button 'Sign up'
      expect(page).to have_content "You have signed up successfully"
    end
  end
end

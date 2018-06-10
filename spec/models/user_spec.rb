require 'rails_helper'

RSpec.describe User, type: :model do

  before (:each) do
    @user = create(:user)
  end

  context '#create' do
    it 'has an email address' do
      expect(User.all.last.email).to eq @user.email
    end

    it 'has a username' do
      expect(User.all.last.username).to eq @user.username
    end
  end
end

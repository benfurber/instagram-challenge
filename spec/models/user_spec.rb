require 'rails_helper'

RSpec.describe User, type: :model do
  before (:each) do
    @user = create(:user)
  end

  it { is_expected.to have_db_column(:email).of_type(:string) }
  it { is_expected.to have_db_column(:username).of_type(:string) }

  it { is_expected.to have_many(:comments) }
end

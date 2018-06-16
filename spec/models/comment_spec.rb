require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Fields' do
    it { is_expected.to have_db_column(:content).of_type(:text) }

    it { is_expected.to have_db_column(:user_id).of_type(:integer) }

    it { is_expected.to have_db_column(:commentable_id).of_type(:integer) }

    it { is_expected.to have_db_column(:commentable_type).of_type(:string) }

    it { is_expected.to belong_to(:commentable) }
  end
end

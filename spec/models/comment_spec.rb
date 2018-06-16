require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Fields' do
    it 'commentable_id exists' do
      expect(db_column(:commentable_id)).to be_a_kind_of(:integer)
    end
    it 'commentable_type exists' do
      expect(db_column(:commentable_type)).to be_a_kind_of(:string)
    end

    it 'belongs to commentable' do
      expect(Subject).to belong_to(:commentable)
    end
  end
end

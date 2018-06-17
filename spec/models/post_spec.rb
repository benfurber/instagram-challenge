require 'rails_helper'
require 'models/concerns/commentable_spec'

RSpec.describe Post, type: :model do
  it_behaves_like "commentable"
end

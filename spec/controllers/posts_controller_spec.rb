require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'when user is authenticated' do
    it { should route(:get, '/posts').to(action: :index) }

    it { should route(:get, '/posts/1').to(action: :show, id: 1) }
  end
end

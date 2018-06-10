require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "GET /posts" do

    it "Allows access when logged in" do
      user = create(:user)
      sign_in(user)
      
      get posts_path
      expect(response).to have_http_status(200)
    end
    it "Blocks access when not logged in" do
      get posts_path
      expect(response).to have_http_status(302)
    end
  end
end

require 'rails_helper'

RSpec.describe PostsController, type: :controller do


  before (:each) do
    @test_user = create(:user)
    sign_in(@test_user)
    @post = create(:post, user: @test_user)
  end
  let(:valid_attributes) { @post }
  let(:invalid_attributes) {}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: @post.to_param}, session: valid_session
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: @post.to_param}, session: valid_session
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect { create(:post, user: @test_user) }.to change(Post, :count).by(1)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      expect {
        delete :destroy, params: {id: @post.to_param}, session: valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete :destroy, params: {id: @post.to_param}, session: valid_session
      expect(response).to redirect_to(posts_url)
    end
  end

end

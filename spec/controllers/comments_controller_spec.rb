require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before (:each) {
    sign_in
    @post = create(:post, user: @user)
    @comment = create(:comment, valid_attributes)
  }

  let(:valid_attributes) {
    {
      'body': 'Great photo',
      'post': @post,
      'user': @user
    }
  }

  let(:invalid_attributes) {
    {
      'body': '',
      'post': nil,
      'user': nil
    }
  }

  describe "User authentication" do
    it "blocks unauthenticated access" do
      sign_in nil
      get :show, params: { id: @comment.id }

      expect(response).to redirect_to(new_user_session_path)
    end

    it "allows authenticated access" do
      get :show, params: { id: @comment.id }

      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: @comment.id}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: @comment.to_param}
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes}
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the created comment" do
        post :create, params: {comment: valid_attributes}
        expect(response).to redirect_to(Comment.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {comment: {}}
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: new_attributes}, session: valid_session
        comment.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(comment)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, params: {id: comment.to_param}, session: valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete :destroy, params: {id: comment.to_param}, session: valid_session
      expect(response).to redirect_to(comments_url)
    end
  end

end

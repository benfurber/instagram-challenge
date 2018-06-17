require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    @user = create(:user)
    @post = create(:post, 'user' => @user)
    assign(:comment, create(
      :comment,
      :user => @user,
      :commentable => @post
    ))
  end

  it "renders new comment form" do
    p comments_path

    render

    assert_select "form[action=?][method=?]", comments_path, "post" do
      assert_select "input[name=?]", "comment[content]"
    end
  end
end

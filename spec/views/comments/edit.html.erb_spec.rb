require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    user = create(:user)
    @post = create(:post, 'user' => user)
    @comment = create(
      :comment,
      :user => user,
      :commentable => @post
    )
  end

  it "renders the edit comment form" do
    p "#{post_path(@post)}#{comment_path(@comment)}"
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input[name=?]", "comment[user]"

      assert_select "textarea[name=?]", "comment[body]"

      assert_select "input[name=?]", "comment[post]"
    end
  end
end

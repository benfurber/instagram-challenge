require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    user = create(:user)
    post = create(:post, 'user' => user)
    @comment = assign(:comment, Comment.create!(
      :user => user,
      :content => "Boring test content",
      :commentable => post
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input[name=?]", "comment[user]"

      assert_select "textarea[name=?]", "comment[body]"

      assert_select "input[name=?]", "comment[post]"
    end
  end
end

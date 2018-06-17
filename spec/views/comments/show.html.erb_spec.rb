require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:each) do
    @user = create(:user)
    @post = create(:post, 'user' => @user)
    @comment = create(
      :comment,
      :user => @user,
      :commentable => @post
    )
  end

  it "renders attributes" do
    render
    expect(rendered).to match(@user.username)
    expect(rendered).to match(@comment.content)
  end
end

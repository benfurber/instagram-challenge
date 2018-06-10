require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign_post
  end

  it "renders attributes in" do
    render
    expect(rendered).to have_content(@post.description)
  end

  it "renders comments section" do
    render
    expect(rendered).to have_content("Add your comment")
  end
end

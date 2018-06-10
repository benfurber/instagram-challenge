require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign_post
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to have_content(@post.description)
  end
end

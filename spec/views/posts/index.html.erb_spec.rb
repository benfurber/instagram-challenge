require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    @posts = [assign_post]
  end

  it "renders a list of posts" do
    render
    expect(rendered).to have_content(@posts.last.description)
  end
end

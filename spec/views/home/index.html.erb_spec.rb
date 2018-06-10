require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  before (:each) do
    render :template => 'home/index.html.erb'
  end

  it 'Has a title' do
    expect(rendered).to have_content("Welcome to Instagram")
  end

  it 'Has a sub-title' do
    expect(rendered).to have_content("The best Instagram clone you'll see in the next five minutes")
  end
end

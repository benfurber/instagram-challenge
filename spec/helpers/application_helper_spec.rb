require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "appname" do
    it "returns the name of the site" do
      expect(helper.appname).to eq "Instagram"
    end
  end
end

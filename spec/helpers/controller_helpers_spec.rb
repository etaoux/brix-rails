# coding: utf-8
require "spec_helper"
describe Brix::Rails::ViewHelpers do
  include Brix::Rails::ControllerHelpers

  describe "#drop_breadcrumb" do
    it "should work" do
      drop_breadcrumb("Ruby","http://ruby-lang.org")
      drop_breadcrumb("Rails","http://rubyonrails.org")
      @bx_breadcrumbs.should == [["Ruby","http://ruby-lang.org"],["Rails","http://rubyonrails.org"]]
    end
  end
end
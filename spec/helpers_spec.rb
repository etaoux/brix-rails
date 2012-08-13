# coding: utf-8
require "spec_helper"
describe Brix::Rails::Helpers do
  describe "#bx_button_tag" do
    context "Link" do
      it "支持 A 标签的按钮" do
        bx_link_to("注册", "/sign_up", :color => :red, :size => 23).should == link_to("注册", "/sign_up", :class => "btn btn-red btn-size23")
        bx_link_to("注册", "/sign_up", :color => :blue, :size => 23).should == link_to("注册", "/sign_up", :class => "btn btn-blue btn-size23")
        bx_link_to("注册", "/sign_up", :color => :orange, :size => 23).should == link_to("注册", "/sign_up", :class => "btn btn-orange btn-size23")
        bx_link_to("注册", "/sign_up", :color => :aaa, :size => 23).should == link_to("注册", "/sign_up", :class => "btn btn-size23")
      end

      it "没有 size 的时候是否会有默认的" do
        bx_link_to("注册", "/sign_up", :color => :red).should == link_to("注册", "/sign_up", :class => "btn btn-red btn-size30")
      end

      it "没有 color 的时候是否正确" do
        bx_link_to("注册", "/sign_up").should == link_to("注册", "/sign_up", :class => "btn btn-size30")
      end

      it "是否支持 disabled" do
        bx_link_to("注册", "/sign_up", :disabled => true).should == link_to("注册", "/sign_up", :disabled => true, :class => "btn btn-size30 btn-disabled")
      end

      it "是否支持默认的功能" do
        bx_link_to("注册", "/sign_up", :onclick => "return false;", :rel => "nofollow", :target => "_blank").should == link_to("注册", "/sign_up", :onclick => "return false;", :rel => "nofollow", :target => "_blank", :class => "btn btn-size30")
      end
    end

    context "Button" do
      it "支持 button 标签的按钮" do
        bx_button_tag("go",:type => "submit", :color => :blue).should == content_tag(:button, "go", :type => :submit, :class => "btn btn-blue btn-size30")
        bx_button_tag("go",:type => "submit", :color => :orange).should == content_tag(:button, "go", :type => :submit, :class => "btn btn-orange btn-size30")
        bx_button_tag("go",:type => "submit", :size => 45).should == content_tag(:button, "go", :type => :submit, :class => "btn btn-size45")
      end

      it "支持 Disabled 属性" do
        bx_button_tag("go",:disabled => true, :size => 45).should == content_tag(:button, "go", :class => "btn btn-size45 btn-disabled", :disabled => true)
      end

      it "支持标准的属性" do
        bx_button_tag("go",:remote => true).should == content_tag(:button, "go",:remote => true, :class => "btn btn-size30")
      end
    end
  end
end
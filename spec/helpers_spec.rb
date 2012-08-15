# coding: utf-8
require "spec_helper"
describe Brix::Rails::Helpers do
  describe "#bx_button_tag" do
    context "Link" do
      it "支持 A 标签的按钮" do
        bx_link_to("注册", "/sign_up", :color => :red, :size => :large).should == link_to("注册", "/sign_up", :class => "btn btn-red btn-large")
        bx_link_to("注册", "/sign_up", :color => :blue, :size => :xlarge).should == link_to("注册", "/sign_up", :class => "btn btn-blue btn-xlarge")
        bx_link_to("注册", "/sign_up", :color => :orange, :size => :small).should == link_to("注册", "/sign_up", :class => "btn btn-orange btn-small")
        bx_link_to("注册", "/sign_up", :color => :aaa, :size => :xsmall).should == link_to("注册", "/sign_up", :class => "btn btn-xsmall")
        bx_link_to("注册", "/sign_up", :color => :aaa, :size => :medium).should == link_to("注册", "/sign_up", :class => "btn btn-medium")
      end

      it "没有 size 的时候是否会有默认的" do
        bx_link_to("注册", "/sign_up", :color => :red).should == link_to("注册", "/sign_up", :class => "btn btn-red")
      end

      it "没有 color 的时候是否正确" do
        bx_link_to("注册", "/sign_up").should == link_to("注册", "/sign_up", :class => "btn")
      end

      it "是否支持 disabled" do
        bx_link_to("注册", "/sign_up", :disabled => true).should == link_to("注册", "/sign_up", :disabled => true, :class => "btn btn-disabled")
      end

      it "是否支持默认的功能" do
        bx_link_to("注册", "/sign_up", :onclick => "return false;", :rel => "nofollow", :target => "_blank").should == link_to("注册", "/sign_up", :onclick => "return false;", :rel => "nofollow", :target => "_blank", :class => "btn")
      end
    end

    context "Button" do
      it "支持 button 标签的按钮" do
        bx_button_tag("go",:type => "submit", :color => :blue).should == content_tag(:button, "go", :type => :submit, :class => "btn btn-blue")
        bx_button_tag("go",:type => "submit", :color => :orange).should == content_tag(:button, "go", :type => :submit, :class => "btn btn-orange")
        bx_button_tag("go",:type => "submit", :size => :xlarge).should == content_tag(:button, "go", :type => :submit, :class => "btn btn-xlarge")
      end

      it "支持 Disabled 属性" do
        bx_button_tag("go",:disabled => true, :size => :xlarge).should == content_tag(:button, "go", :class => "btn btn-xlarge btn-disabled", :disabled => true)
      end

      it "支持标准的属性" do
        bx_button_tag("go",:remote => true).should == content_tag(:button, "go",:remote => true, :class => "btn")
      end
    end
  end

  describe "#bx_icon_tag" do
    it "should work" do
      bx_icon_tag("ƚ").should == '<i class="iconfont">ƚ</i>'
    end

    it "支持标签文字" do
      bx_icon_tag("ƚ", :label => "Label").should == '<i class="iconfont">ƚ</i>Label'
    end

    it "支持自定义 class" do
      bx_icon_tag("ƚ", :class => "icon1").should == '<i class="iconfont icon1">ƚ</i>'
    end
  end

  describe "#bx_select_tag" do
    it "Should work" do
      html = bx_select_tag("post[category]", 3, :collection => [["Ruby",1],["Ruby on Rails",2],["Python",3],["Tornado",4]])
      html.should include("bx-dropdown-post-category")
    end
  end

  describe "#bx_switcher_tag" do
    it "should work" do
      bx_switcher_tag("post[sex]", true, :labels => %w(Male Female)).should include("switcher-on")
      bx_switcher_tag("post[sex]", false, :labels => %w(Male Female)).should_not include("switcher-on")
    end
  end

  describe "#bx_loading_tag" do
    it "should work" do
      bx_loading_tag("loading", :style => 1).should == content_tag(:span, raw('<img />loading'), :class => "loading", 'bx-name' => 'loading', 'bx-config' => '{loadingStyle:1}')
    end

    it "支持 nil 的 label" do
      bx_loading_tag(nil, :style => 2).should == content_tag(:span, tag(:img), :class => "loading", 'bx-name' => 'loading', 'bx-config' => '{loadingStyle:2}')
    end

    it "支持无参数的调用" do
      bx_loading_tag.should ==  content_tag(:span, tag(:img), :class => "loading", 'bx-name' => 'loading', 'bx-config' => '{loadingStyle:0}')
    end
  end
end
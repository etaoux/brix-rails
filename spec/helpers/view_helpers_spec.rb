# coding: utf-8
require "spec_helper"
describe Brix::Rails::ViewHelpers do
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
      bx_icon_tag("ƚ", :label => "Label").should == '<i class="iconfont">ƚ</i> Label'
    end

    it "支持自定义 class" do
      bx_icon_tag("ƚ", :class => "icon1").should == '<i class="iconfont icon1">ƚ</i>'
    end

    it "支持直接用数字编号作为 char 参数" do
      bx_icon_tag(33).should == '<i class="iconfont">&#33</i>'
      bx_icon_tag("233").should == '<i class="iconfont">&#233</i>'
    end
  end

  describe "#bx_select_tag" do
    it "Should work" do
      html = bx_select_tag("post[category]", 3, :collection => [["Ruby",1],["Ruby on Rails",2],["Python",3],["Tornado",4]])
      html.should have_tag('div', :with => { 'id' => 'bx_dropdown_post_category', 'bx-name' => "dropdown", 'bx-tmpl' => 'dropdown', 'class' => 'dropdown' }) do
        with_tag('span', :with => { 'class' => "dropdown-hd" }) do
          with_tag('span', :with => { 'class' => 'dropdown-text', :value => 3 }, :text => "Python")
        end
        with_tag('ul', :with => { 'class' => 'dropdown-list' }) do
          with_tag('li', :count => 4) do
            with_tag(:span)
            with_tag(:i, :with => { :class => "iconfont icon-ok" }, :text => "~")
          end
          with_tag('li', :with => { 'class' => 'dropdown-item' }, :count => 3)
          with_tag('li', :with => { 'class' => 'dropdown-item dropdown-itemselected' }, :count => 1) do
            with_tag('span', :with => { :value => 3}, :text => "Python")
          end
        end
      end
    end

    it "支持 collection 为空的情况" do
      bx_select_tag("post[category]", 3).should have_tag('div#bx_dropdown_post_category', :with => { 'bx-name' => "dropdown", 'bx-tmpl' => 'dropdown', 'class' => 'dropdown' })
    end

    it "当 value 为空的时候，选择项为第一个" do
      bx_select_tag("post[category]", nil, :collection => [["Ruby",1],["Rails",2]]).should have_tag('div') do
        with_tag('span', :with => { 'class' => "dropdown-hd" }) do
          with_tag('span', :with => { 'class' => 'dropdown-text', :value => 1 }, :text => "Ruby")
          with_tag('li', :with => { 'class' => 'dropdown-item dropdown-itemselected' }, :count => 1) do
            with_tag("span", :with => { :value => 1 }, :text => "Ruby")
          end
        end
      end
    end
  end

  describe "#bx_switcher_tag" do
    it "should work" do
      bx_switcher_tag("post[sex]", true, :labels => %w(Male Female)).should include("switcher-on")
      bx_switcher_tag("post[sex]", false, :labels => %w(Male Female)).should_not include("switcher-on")
    end

    it "支持不带 labels 的情况" do
      bx_switcher_tag("post[publish]",true).should have_tag('div#post_publish', :with => { 'bx-name' => "switcher", 'bx-tmpl' => 'switcher', 'class' => 'switcher switcher-on' }) do
        with_tag('span', :with => { :class => "switcher-trigger switcher-on" })
        with_tag('input', :with => { :type => "hidden", :name => 'post[publish]' })
      end
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

  describe "#bx_breadcrumbs_tag" do
    it "should work" do
      @bx_breadcrumbs = [["Ruby","#1"],["Rails",'#2']]
      bx_breadcrumbs_tag.should have_tag('ul', :with => { 'bx-name' => "breadcrumbs", :class => "breadcrumbs" }) do
        with_tag('li.item', :count => 4)
        with_tag('li.item', :text => "Ruby")
        with_tag('li.label', :text => "你的位置:")
        with_tag('li', :with => { :class => 'item split' }, :count => 1)
      end
    end

    it "should work when @bx_breadcrumbs is nil" do
      @bx_breadcrumbs = nil
      bx_breadcrumbs_tag.should have_tag(:ul, :with => { 'bx-name' => "breadcrumbs", :class => 'breadcrumbs' })
    end

    it "支持更改标签内容" do
      bx_breadcrumbs_tag("AAA").should have_tag(:ul, :with => { 'bx-name' => "breadcrumbs", :class => 'breadcrumbs' }) do
        with_tag('li.label', :text => "AAA")
      end
    end
  end
end
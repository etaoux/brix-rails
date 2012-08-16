# coding: utf-8
require 'mustache'

module Brix
  module Rails
    module ViewHelpers
      def bx_button_tag(label, opts = {})
        class_names = %w(btn)
        color = opts.delete(:color)
        class_names << "btn-#{color}" if color.to_s.in?(%w(red blue orange))
        size = opts.delete(:size)
        class_names << "btn-#{size}" if size.to_s.in?(%w(xlarge large medium small xsmall tiny))
        class_names << "btn-disabled" if opts[:disabled] == true
        opts.merge!(:class => class_names.join(" "))
        href = opts.delete(:href)
        if href.blank?
          content_tag(:button, label, opts)
        else
          link_to(label, href, opts)
        end
      end


      def bx_link_to(label, href, opts = {})
        opts[:href] = href
        bx_button_tag(label, opts)
      end

      # Generate <i class="iconfont">&##{char}</i>
      # params:
      #   char  :  可接受一个数字（最后会在前面加上 &#），可以是直接的字体字符
      #
      def bx_icon_tag(char, opts = {})
        opts[:label] ||= ""
        class_name = opts.delete(:class)
        if char.to_s.match(/[\d]+/)
          char = "&##{char}"
        end
        label = opts.delete(:label)
        label = " #{label}" if !label.blank?
        class_names = ["iconfont"]
        class_names << class_name if !class_name.blank?
        opts[:class] = class_names.join(" ")
        icon = content_tag(:i, raw(char), opts)
        raw [icon,label].join("")
      end

      BX_SELECT_TAG_TEMPLATE = %(
<div id="bx_dropdown_{{id}}" bx-name="dropdown" bx-datakey="items" bx-tmpl="dropdown" class="dropdown">
  {{#items}}{{#selected}}
  <span class="dropdown-hd"><span class="dropdown-text" value="{{value}}">{{label}}</span><i class="iconfont icon-arrow-down">&#405</i></span>
  {{/selected}}{{/items}}
  <ul class="dropdown-list">{{#items}}
  <li class="dropdown-item{{#selected}} dropdown-itemselected{{/selected}}"><span value="{{value}}">{{label}}</span><i class="iconfont icon-ok">&#126</i></li>
  {{/items}}</ul>
  {{#items}}{{#selected}}<input name="{{name}}" value="{{value}}" type="hidden" />{{/selected}}{{/items}}
</div>
        )
      def bx_select_tag(name, value, opts = {})
        value = value
        collection = opts[:collection]
        id = name.parameterize("_")

        items = []
        value_in_collection = false
        if !collection.blank?
          collection.collect do |c|
            item = {
              'value' => c[1],
              'label' => c[0]
            }
            if c[1].to_s.strip == value.to_s.strip
              item['selected'] = true
              value_in_collection = true
            end
            items << item
          end
        end
        if !value_in_collection and !items.blank?
          items[0]['selected'] = true
        end
        raw Mustache.render(BX_SELECT_TAG_TEMPLATE, :id => id, :name => name, :items => items)
      end

      BX_SWITCHER_TAG_TEMPLATE = %(
{{#label0}}<span>{{label0}}</span>{{/label0}}
<div id="{{id}}" bx-name="switcher" bx-tmpl="switcher" class="switcher{{#on}} switcher-on{{/on}}">
  <span class="switcher-trigger{{#on}} switcher-on{{/on}}"></span>
  <input type="hidden" name="{{name}}" value="{{on}}" />
</div>
{{#label1}}<span>{{label1}}</span>{{/label1}}
)
      def bx_switcher_tag(name, value, opts = {})
        value = (value == true ? true : false)
        id = name.parameterize("_")
        labels = opts[:labels] || []
        raw Mustache.render(BX_SWITCHER_TAG_TEMPLATE, :id => id, :name => name, :on => value, :laebl0 => labels[0], :label1 => labels[1])
      end

      def bx_loading_tag(label = nil, opts = {})
        style = opts.delete(:style)
        style = 0 if not style.in?([0,1,2,3])
        label ||= ""
        class_name = opts.delete(:class)
        class_names = ["loading"]
        class_names << class_name if !class_name.blank?
        opts.merge!({ 'bx-name' => "loading", 'bx-config' => "{loadingStyle:#{style}}", 'class' => class_names.join(" ") })
        content_tag(:span,raw([tag(:img),label].join("")),opts)
      end

      def bx_breadcrumbs_tag(label = "你的位置:")
        @bx_breadcrumbs ||= []
        label_li = content_tag(:li, label, :class => "item label")
        lis = @bx_breadcrumbs.collect do |item|
          content_tag(:li, link_to(item[0], item[1]), :class => "item")
        end
        split_li = '<li class="item split"><i class="iconfont">ƒ</i></li>'
        content_tag(:ul, raw([label_li,lis.join(split_li)].join("")), :class => "breadcrumbs", 'bx-name' => "breadcrumbs")
      end
    end # Helpers
  end
end
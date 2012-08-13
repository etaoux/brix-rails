require 'mustache'

module Brix
  module Rails
    module Helpers
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

      BX_SELECT_TAG_TEMPLATE = %(
<div id="bx-dropdown-{{id}}" bx-name="dropdown" bx-datakey="items" bx-tmpl="dropdown" class="dropdown">
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
        id = name.parameterize

        items = []
        collection.collect do |c|
          item = {
            'value' => c[1],
            'label' => c[0]
          }
          item['selected'] = true if c[1].to_s.strip == value.to_s.strip
          items << item
        end
        if value.blank? and items.count > 0
          items[0]['selected'] = true
        end
        raw Mustache.render(BX_SELECT_TAG_TEMPLATE, :id => id, :name => name, :items => items)
      end

      BX_SWITCHER_TAG_TEMPLATE = %(
<label class="label">{{label0}}</label>
<div id="{{id}}" bx-name="switcher" bx-tmpl="switcher" class="switcher">
  <span class="switcher-trigger{{#on}} switcher-on{{/on}}"></span>
</div>
<label class="label">{{label1}}</label>
)
      def bx_switcher_tag(name, value, opts = {})
        value = (value == true ? true : false)
        id = name.parameterize
        labels = opts[:labels] || []
        if labels.count == 2
          raw Mustache.render(BX_SWITCHER_TAG_TEMPLATE, :id => id, :name => name, :on => value, :laebl0 => labels[0], :label1 => labels[1])
        end
      end
    end # Helpers
  end
end
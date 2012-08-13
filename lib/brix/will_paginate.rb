# config/initializers/will_paginate.rb
#
# This extension code was written by Isaac Bowen, originally found
# at http://isaacbowen.com/blog/using-will_paginate-action_view-and-bootstrap/

require 'will_paginate/view_helpers/action_view'

module WillPaginate
  module ActionView
    def will_paginate(collection = nil, options = {})
      options, collection = collection, nil if collection.is_a? Hash
      # Taken from original will_paginate code to handle if the helper is not passed a collection object.
      collection ||= infer_collection_from_controller
      options[:renderer] ||= BrixLinkRenderer
      super.try :html_safe
    end

    class BrixLinkRenderer < LinkRenderer
      protected

      def html_container(html)
        tag :div, tag(:div, tag(:div, html, :class => "pagination-page"), :class => "pagination-pages"), container_attributes
      end

      def page_number(page)
        link(page, page, :rel => rel_value(page), :class => (page == current_page ? "page-cur" : "page"))
      end

      def gap
        tag :span, "...", :class => "page-split"
      end

      def previous_or_next_page(page, text, classname)
        puts classname
        class_name = [("page-#{classname[0..3]}" if  @options[:page_links]), (classname if @options[:page_links]), ('disabled' unless page)].join(' ')
        link(text, (page || '#'), :class => class_name)
      end
    end
  end
end
module Brix
  module Rails
    module Helpers
      def bx_button_tag(label, opts = {})
        class_names = %w(btn)
        color = opts.delete(:color)
        class_names << "btn-#{color}" if color.to_s.in?(%w(red blue orange))
        size = opts.delete(:size)
        class_names << "btn-#{size}" if size.to_s.in?(%w(xlarge large medium small xsmall))
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
    end
  end
end
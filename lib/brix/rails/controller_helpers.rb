# coding: utf-8
module Brix
  module Rails
    module ControllerHelpers
      def drop_breadcrumb(name, url = nil)
        url ||= request.url
        @bx_breadcrumbs ||= []
        @bx_breadcrumbs << [name, url]
      end
    end
  end
end
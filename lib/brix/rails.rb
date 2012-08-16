require "brix/rails/version"
require "brix/rails/helpers"
require "brix/will_paginate"
require "brix/simple_form"

module Brix
  module Rails
    if ::Rails.version < "3.1"
      require "brix/rails/railte"
    else
      require "brix/rails/engine"
    end
  end
end

ActionView::Base.send :include, Brix::Rails::Helpers
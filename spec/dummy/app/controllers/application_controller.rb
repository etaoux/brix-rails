class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_root_breadcrumb

  def init_root_breadcrumb
    drop_breadcrumb("Home", root_path)
  end
end

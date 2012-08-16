require 'rails'

module Brix
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Copy brix-rails default files"
      source_root File.expand_path('../templates', __FILE__)

      def copy_scaffold_template
        template_root = "lib/templates/erb/scaffold"
        %w(_form edit index new show).each do |fname|
          copy_file "#{fname}.html.erb", "#{template_root}/#{fname}.html.erb"
        end

        copy_file "scaffold_controller/controller.rb", "lib/templates/rails/scaffold_controller/controller.rb"
      end


      def copy_shared_error_messages_view
        copy_file "shared/_error_messages.html.erb", "app/views/shared/_error_messages.html.erb"
      end
    end
  end
end
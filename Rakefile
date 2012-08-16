require "bundler/gem_tasks"

ROOT_PATH = File.dirname(__FILE__)

def replace_file(file_name, from, to)
  File.open(file_name, "r+") do |f|
    out = ""
    f.each do |line|
        out << line.gsub(from, to)
    end
    f.pos = 0
    f.print out
    f.truncate(f.pos)
  end
end

namespace :assets do
  desc 'Update assets from Brix source'
  task :update do
    @dist_path = "../brix/dist/"
    @assets_path = "#{ROOT_PATH}/vendor/assets/"
    if not File.directory?(@dist_path)
      puts "(WARNNING) Brix source not exist, please clone it from git://github.com/etaoux/brix.git to ../brix"
      exit(0)
    end
    copy_file([@dist_path,"brix-min.css"].join("/"), "#{@assets_path}stylesheets/brix/base.scss")
    copy_file([@dist_path,"brix-min.js"].join("/"), "#{@assets_path}javascripts/brix/base.js")
    %w(breadcrumbs colorpicker dialog dropdown fold form inplaceeditor kwicks pagination starrating switcher loading).each do |c_name|
      copy_file([@dist_path,"gallery",c_name,"index-min.js"].join("/"), "#{@assets_path}javascripts/brix/#{c_name}.js")
      css_path = [@dist_path,"gallery",c_name,"#{c_name}-min.css"].join("/")
      to_css_path = "#{@assets_path}stylesheets/brix/#{c_name}.scss"
      if File.exist?(css_path)
        copy_file(css_path, to_css_path)
      end
    end
  end
end

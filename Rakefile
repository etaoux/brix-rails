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
    @dist_path = "../brix/dist/2.0"
    @assets_path = "#{ROOT_PATH}/app/assets/"
    if not File.directory?(@dist_path)
      puts "(WARNNING) Brix source not exist, please clone it from git://github.com/etaoux/brix.git to ../brix"
      exit(0)
    end
    copy_file([@dist_path,"brix-min.css"].join("/"), "#{@assets_path}stylesheets/brix/base.scss")
    copy_file([@dist_path,"brix-min.js"].join("/"), "#{@assets_path}javascripts/brix/base.js")
    %w(avatar breadcrumbs calendar colorpicker dialog dialog dropdown flowsteps fold footer form inplaceeditor kwicks lavalamp loading login msgbox mu multimedia mustache pagination placeholder profile property scrollbar searchbox share sidenav slider starrating switchable switcher tables tags timer tooltip visibility).each do |c_name|
      js_path = [@dist_path,"gallery",c_name,"index-min.js"].join("/")
      if File.exist?(js_path)
        copy_file(js_path, "#{@assets_path}javascripts/brix/#{c_name}.js")
      end
      css_path = [@dist_path,"gallery",c_name,"index-min.css"].join("/")
      to_css_path = "#{@assets_path}stylesheets/brix/#{c_name}.scss"
      if File.exist?(css_path) 
        copy_file(css_path, to_css_path)
      end
    end
  end
end

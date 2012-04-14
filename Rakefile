#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'UtopiaData Documentation'
  rdoc.options += %w[ --line-numbers --charset utf-8 -f horo]
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'


desc "update documentation"
task :update_documentation  => :rdoc do

  system 'mv rdoc /tmp/rdoc'
  system 'git checkout gh-pages'
  system 'rm -Rf doc/code'
  system 'mv /tmp/rdoc doc/code'
  system 'git add doc/'
  system 'git commit -m "updated code documentation"'
  system 'git push origin gh-pages'
  system 'git checkout master'

end

Bundler::GemHelper.install_tasks
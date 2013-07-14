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
  rdoc.title    = 'DmCore'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

APP_RAKEFILE = File.expand_path("../test/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'



Bundler::GemHelper.install_tasks


require 'active_record'
begin
  require 'rspec/core'
  require 'rspec/core/rake_task'

  namespace :spec do
    RSpec::Core::RakeTask.new(:smoke => 'db:test:load') do |t|
      t.rspec_opts = "--tag @smoke"
      t.rspec_opts << " --format documentation --color --profile" if ENV['BUILD_NUMBER']
    end

    RSpec::Core::RakeTask.new(:fast, [:seed] => 'db:test:load') do |t, args|
      t.pattern = FileList['spec/**/*_spec.rb'].exclude(/acceptance/)
      t.rspec_opts = "--seed #{args[:seed]}" if args[:seed]
      t.rspec_opts = "--format documentation --color --profile" if ENV['BUILD_NUMBER']
    end

    RSpec::Core::RakeTask.new(:sluggish => 'db:test:load') do |t|
      t.pattern = Dir['./spec/**/*_spec.rb']
      t.rspec_opts = "--format documentation --color --profile" if ENV['BUILD_NUMBER']
    end

    RSpec::Core::RakeTask.new(:acceptance => 'db:test:load') do |t|
      t.pattern = ['spec/acceptance/**/*_spec.rb']
      t.rspec_opts = "--format documentation --color --profile" if ENV['BUILD_NUMBER']
    end
  end
rescue LoadError
  # No worries. Rspec doesn't exist in this environment
end



task :default => ['db:test:prepare', 'spec:fast', 'spec:acceptance']

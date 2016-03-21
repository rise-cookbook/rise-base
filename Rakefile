require 'rubygems'
gem 'ci_reporter'

RSpec::Core::RakeTask.new(:spec) do |t|
t.pattern = Dir.glob('spec/**/**/*_spec.rb')
t.rspec_opts = '--format documentation'


task :default => :spec
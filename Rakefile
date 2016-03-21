require 'rake'
require 'rspec/core/rake_task'
require 'rubygems'
gem 'ci_reporter'

Rake.application.options.trace_rules = true

RSpec::Core::RakeTask.new(:spec) do |t|
t.pattern = Dir.glob('spec/**/**/*_spec.rb')
t.rspec_opts = '--format documentation'
end

task :default => :spec
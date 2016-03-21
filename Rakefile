require 'rake'
require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'

ENV['GENERATE_REPORTS'] = 'true'
ENV['CI_REPORTS'] = 'spec/reports/'

Rake.application.options.trace_rules = true

RSpec::Core::RakeTask.new(:spec) do |t|
t.pattern = Dir.glob('spec/**/**/*_spec.rb')
t.rspec_opts = '--format documentation'
end

namespace :unit_test do
	task :rspec => 'ci:setup:rspec'

	task :chef => :spec
end

task :all => ['unit_test:rspec', 'unit_test:chef', ]
task :default => :all
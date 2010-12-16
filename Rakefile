require 'cucumber/rake/task'

desc 'Run all features'
task :cucumber => 'cucumber:all'

namespace :cucumber do
  Cucumber::Rake::Task.new(:all) do |t|
    t.cucumber_opts = '--format pretty'
  end

  Cucumber::Rake::Task.new(:rcov) do |t|
    t.rcov = true
    t.rcov_opts = %w[-Ilib -xfeatures -ocoverage]
  end
end


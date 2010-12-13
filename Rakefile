require 'cucumber/rake/task'

task :cucumber do
  ENV['RUBYLIB'] = './lib:' + (ENV['RUBYLIB'] || '')
  sh 'cucumber features/*.feature'
end


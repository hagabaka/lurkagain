require 'fakefs/safe'

Given /^the file "([^"]*)" contains:$/ do |filename, string|
  FakeFS.activate!
  path = File.expand_path filename
  FileUtils.mkdir_p File.dirname(path)
  File.open(path, 'w') {|f| f.write string}
  FakeFS.deactivate!
end

When /^I load "([^"]*)"'s configuration$/ do |client|
  require "lurkagain/#{client.downcase}/handler"
  FakeFS.activate!
  @configuration = LurkAgain::const_get(client)::Handler.new.read
  FakeFS::FileSystem.clear
  FakeFS.deactivate!
end


require 'rspec/expectations'

Given /^I have the following text:$/ do |string|                                                                                               
  @parse_text = string
end                                                                                                                                            
                                                                                                                                               
When /^I use the "([^"]*)" parser to parse the text$/ do |path|
  require "lurkagain/#{path}"
  modules = path.split('/').map(&:capitalize)  
  modules[-1] += 'Parser'
  @parser = modules.reduce(LurkAgain, :const_get).new
  @parse_result = @parser.parse @parse_text
  announce @parser.failure_reason if @parse_result.nil?
end                                                                                                                                            
                                                                                                                                               
Then /^I should get the following data:$/ do |expected|
  require 'yaml'
  @parse_result.data.should == YAML.load(expected)
end


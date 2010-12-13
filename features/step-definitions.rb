require 'rspec/expectations'

Given /^I have the following network file:$/ do |string|                                                                                       
  @content = string
end                                                                                                                                            
                                                                                                                                               
When /^I parse the file$/ do                                                                                                                   
  require 'treetop'
  require 'lurkagain/clients/chatzilla/networks'
  @parser = LurkAgain::Clients::Chatzilla::NetworksParser.new
  @parse_result = @parser.parse @content
end                                                                                                                                            

Then /^I should get the following network data:$/ do |yaml|                                                                                   
  announce @parser.failure_reason if @parse_result.nil?

  require 'yaml'
  @parse_result.networks.should == YAML.load(yaml)
end

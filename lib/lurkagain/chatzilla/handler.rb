require 'lurkagain/configuration'
require 'iniparse'
require 'initializedclass'
require 'treetop'
require 'lurkagain/chatzilla/networks'

module LurkAgain
  module Chatzilla
    # Configuration handler for ChatZilla
    class Handler < InitializedClass.new(:home_path, :profile_name)

      def initialize(*a)
        super
        
        # For each ChatZilla installation and user, there can be multiple
        # profiles, all located in one directory, e.g. ~/.chatzilla. We
        # call this Chatzilla's home path
        @home_path ||= File.join(ENV['HOME'], '.chatzilla')
        @profile_name = 'default'

        # profiles.ini under the home path contains a list of profiles
        profile_list = File.join(@home_path, 'profiles.ini')
        sections = IniParse.parse File.read(profile_list)

        # Each profile has a section labled Profile*
        profile = sections.find do |section|
          section.key =~ /^Profile/ && section['Name'] == @profile_name
        end

        # The path containing profile data is in the option Path
        profile_path = File.join(@home_path, profile['Path'])

        # Preferences for the profile are stored in prefs.js, and list of
        # networks in networks.txt
        @preference_file = File.join(profile_path, 'prefs.js')
        @network_file = File.join(profile_path, 'networks.txt')
      end

      def read
        configuration = LurkAgain::Configuration.new

        networks = NetworksParser.new.parse File.read(@network_file)
        #preferences = PreferencesParser.new.parse File.read(@preference_file)

        Configuration.new(:networks => networks)
      end
      
      def write(configuration)
        
      end
    end
  end
end

require 'initializedclass'

module LurkAgain
  class Configuration < InitializedClass.new(:networks, :channels)
    def initialize(*a)
      super
      @networks ||= []
      @channels ||= []
    end

    def merge(other)
       
    end
  end

  class Network < InitializedClass.new(:name, :servers)
    def initialize(*a)
      super
      @servers ||= []
    end
  end

  class Server < InitializedClass.new(:hostname, :port, :secure)
     
  end
end


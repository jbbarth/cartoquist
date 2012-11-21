require "logger"
require "faraday"
require "faraday_middleware"

module Cartoquist
  class Client
    attr_reader :url, :token

    def initialize(url = nil, token = nil)
      url ||= ENV["CARTOQUIST_URL"]
      raise ArgumentError, "Cartoque server URL should be passed as first parameter or through a CARTOQUIST_URL environment variable" if url.nil?
      token ||= ENV["CARTOQUIST_TOKEN"]
      raise ArgumentError, "Cartoque api token should be passed as second parameter or through a CARTOQUIST_TOKEN environment variable" if token.nil?
      @url = url
      @token = token
    end

    def get_applications
      get(:applications)
    end

    def get_databases
      get(:databases)
    end
 
    def get_operating_systems
      get(:operating_systems)
    end

    def get_servers
      get(:servers)
    end

    def get_tomcats
      get(:tomcats)
    end

  private
    # Faraday connection object, cached in a constant for better perf
    def connection
      @connection ||= Faraday.new @url do |c|
        c.headers["X-Api-Token"] = @token
        c.use FaradayMiddleware::ParseJson,       content_type: "application/json"
        #c.use Faraday::Response::Logger,          Logger.new("tmp/faraday.log")
        c.use FaradayMiddleware::FollowRedirects, limit: 3
        c.use Faraday::Response::RaiseError       # raise exceptions on 40x, 50x responses
        c.use Faraday::Adapter::NetHttp
      end
    end

    def get(type, id = nil)
      connection.get("/#{type}.json").body["#{type}"]
    end
  end
end

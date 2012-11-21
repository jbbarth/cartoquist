require "logger"
require "faraday"
require "faraday_middleware"
require "cartoquist/api/applications"
require "cartoquist/api/databases"
require "cartoquist/api/operating_systems"
require "cartoquist/api/servers"
require "cartoquist/api/tomcats"

module Cartoquist
  class Client
    include Cartoquist::API::Applications
    include Cartoquist::API::Databases
    include Cartoquist::API::OperatingSystems
    include Cartoquist::API::Servers
    include Cartoquist::API::Tomcats

    attr_reader :url, :token

    def initialize(url = nil, token = nil)
      url ||= ENV["CARTOQUIST_URL"]
      raise ArgumentError, "Cartoque server URL should be passed as first parameter or through a CARTOQUIST_URL environment variable" if url.nil?
      token ||= ENV["CARTOQUIST_TOKEN"]
      raise ArgumentError, "Cartoque api token should be passed as second parameter or through a CARTOQUIST_TOKEN environment variable" if token.nil?
      @url = url
      @token = token
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

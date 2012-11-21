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
  end
end

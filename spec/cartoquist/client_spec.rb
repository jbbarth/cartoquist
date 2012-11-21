require "spec_helper"
require "cartoquist/client"

describe Cartoquist::Client do
  describe "#new" do
    around(:each) do |example|
      url, token = ENV["CARTOQUIST_URL"], ENV["CARTOQUIST_TOKEN"]
      ENV["CARTOQUIST_URL"] = ENV["CARTOQUIST_TOKEN"] = nil
      begin
        example.run
      ensure
        #restore parameters
        ENV["CARTOQUIST_URL"] = url
        ENV["CARTOQUIST_TOKEN"] = token
      end
    end

    it "raises if no parameter" do
      expect do
        Cartoquist::Client.new
      end.to raise_error ArgumentError
    end

    it "takes an url and a token as parameters" do
      api = Cartoquist::Client.new("localhost", "token-from-params")
      api.url.should == "localhost"
      api.token.should == "token-from-params"
    end

    it "accepts arguments through ENV parameters" do
      #useful for command-line, testing, etc.
      ENV["CARTOQUIST_URL"] = "cartoque.test"
      ENV["CARTOQUIST_TOKEN"] = "token-from-env"
      api = Cartoquist::Client.new
      api.url.should == "cartoque.test"
      api.token.should == "token-from-env"
    end
  end
end

require "spec_helper"
require "cartoquist/client"

describe Cartoquist::Client do
  describe "#new" do
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
      begin
        old_env = ENV.clone
        #useful for command-line, testing, etc.
        ENV["CARTOQUIST_URL"] = "cartoque.test"
        ENV["CARTOQUIST_TOKEN"] = "token-from-env"
        api = Cartoquist::Client.new
        api.url.should == "cartoque.test"
        api.token.should == "token-from-env"
      ensure
        #restore parameters
        ENV["CARTOQUIST_URL"] = old_env["CARTOQUIST_URL"]
        ENV["CARTOQUIST_TOKEN"] = old_env["CARTOQUIST_TOKEN"]
      end
    end
  end
end

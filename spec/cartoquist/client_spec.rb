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


  if ENV["CARTOQUIST_URL"] && ENV["CARTOQUIST_TOKEN"]
    let(:api) { Cartoquist::Client.new }

    describe "#get_applications" do
      it 'get some applications' do
        api.get_applications.should be_a Array
      end
    end

    describe "#get_databases" do
      it 'get some databases' do
        api.get_databases.should be_a Array
      end
    end

    describe "#get_operating_systems" do
      it 'get some operating systems' do
        api.get_operating_systems.should be_a Array
      end
    end

    describe "#get_servers" do
      it 'get some servers' do
        api.get_servers.should be_a Array
      end
    end

    describe "#get_tomcats" do
      it 'get some tomcats' do
        api.get_tomcats.should be_a Array
      end
    end
  else
    $stderr.puts
    $stderr.puts "*"*80
    $stderr.puts "WARNING: No CARTOQUIST_URL or CARTOQUIST_TOKEN defined in environment variables"
    $stderr.puts "         Tests won't be run against a *real* Cartoque server, only fixtures!"
    $stderr.puts "*"*80
    $stderr.puts
  end
end

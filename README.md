# CartoqueClient

cartoque_client is a client for the [Cartoque CMDB project](http://cartoque.org/).

Nothing too fancy for now, it's just base classes to interact with the standard
API. There are great chances it becomes a command-line tool in a near future.

## Installation

**NB**: this gem is automatically installed with the main application. If your
integration scripts run on the same machine as the Cartoque server, it's highly
recommended you directly use the version installed with the application.

In other cases, you can either add this line to your own application's Gemfile:

    gem 'cartoque_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cartoque_client

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

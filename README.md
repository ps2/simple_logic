# SimpleLogic

A ruby gem that parses and evaluates simple boolean statements specified as a string.  Useful for evaluating user supplied input in your application without using ruby's eval().

## Installation

Add this line to your application's Gemfile:

    gem 'simple_logic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_logic

## Usage

in_luck = SimpleLogic.eval("hungry && !fridge_empty || restaurant_nearby", )

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
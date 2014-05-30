# SimpleLogic

A ruby gem that parses and evaluates simple boolean statements specified as a string.  Useful for evaluating user supplied business rules in your application without using ruby's eval().

[![Build Status](https://travis-ci.org/ps2/simple_logic.svg?branch=master)][travis]


[travis]: http://travis-ci.org/ps2/simple_logic

## Installation

Add this line to your application's Gemfile:

    gem 'simple_logic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_logic

## Usage

```ruby
context = { hungry: true, fridge_empty: true, restaurant_nearby: true}
in_luck = SimpleLogic.eval("hungry && !fridge_empty || restaurant_nearby", context)
# => true
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

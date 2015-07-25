RspecPacmanFormatter [![Gem Version](https://badge.fury.io/rb/rspec_pacman_formatter.png)](http://badge.fury.io/rb/rspec_pacman_formatter)
=========

PacMan style formatter for Rspec

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec_pacman_formatter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec_pacman_formatter

Then, when running rspec:

    $ rspec --format RspecPacmanFormatter::Pacman

Or, if you want to use RspecPacmanFormatter::Pacman as your default formatter, simply put the options in your .rspec file:

```ruby
--format RspecPacmanFormatter::Pacman
```

## Sample Output

    $ GAME STARTED
    $ ..*.ᗣ.........ᗣ............ᗧ••••••••••
    $ ...rspec results stuff here...
    $ GAME OVER

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/go-labs/rspec_pacman_formatter.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


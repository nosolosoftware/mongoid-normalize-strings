# Mongoid::Normalize::Strings

Normalize fields of type string in your Mongoid models.

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-normalize-strings'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-normalize-strings

## Usage

```ruby
class Person
  include Mongoid::Document
  include Mongoid::NormalizeStrings

  field :name, type: String
  normalize :name
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/mongoid-normalize-strings/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

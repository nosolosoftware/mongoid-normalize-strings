# Mongoid::Normalize::Strings

Normalize fields of type string in your Mongoid models.

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-normalize-strings'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-normalize-strings

## Compatibility

Mongoid Filterable supports Mongoid versions 3, 4, 5, 6 and now 7.

## Usage

```ruby
class City
  include Mongoid::Document
  include Mongoid::NormalizeStrings

  field :name, type: String
  normalize :name
end

city = City.create(name: 'Córdoba')
city.name # => 'Córdoba'
city.name_normalized # => 'cordoba'
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/mongoid-normalize-strings/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

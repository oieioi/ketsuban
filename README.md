# Ketsuban

Skip unlucky numbers for ActiveRecord surrogate key.

## Usage

```ruby
class User < ApplicationRecord
  include Ketsuban
end
```

```ruby
13.times.map { User.create.id }
# => 1,2,3,5,6,7,8,9,10,11,12,14,15
```

## TODO

- Support other than Postgresql.
- test
- Add Unlucky Numbers

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

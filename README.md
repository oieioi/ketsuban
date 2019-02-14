# Ketsuban

Skip unlucky numbers for ActiveRecord surrogate key.

## Usage

```ruby
class User < ApplicationRecord
  include Ketsuban
  unlucky_numbers [4, 13]
end
```

```ruby
13.times.map { User.create.id }
# => 1,2,3,5,6,7,8,9,10,11,12,14,15
```

## TODO

- Support sqlite3
- Support lambda `unlucky_numbers -> { |next_id| /^4+$/.match(id.to_s) }

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

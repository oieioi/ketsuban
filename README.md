[![https://badge.fury.io/rb/ketsuban.svg](https://badge.fury.io/rb/ketsuban.svg)](https://rubygems.org/gems/ketsuban)
[![Build Status](https://travis-ci.org/oieioi/ketsuban.svg?branch=master)](https://travis-ci.org/oieioi/ketsuban)

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
- Support lambda eg `unlucky_numbers -> { |next_id| /^4+$/.match(next_id.to_s) }`

## Test

```
cd test/dummy
bundle exec rails db:setup
bundle exec rake db_mysql:setup
cd ../../
bundle exec bin/test
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

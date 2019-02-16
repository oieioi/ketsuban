[![https://badge.fury.io/rb/ketsuban.svg](https://badge.fury.io/rb/ketsuban.svg)](https://rubygems.org/gems/ketsuban)
[![Build Status](https://travis-ci.org/oieioi/ketsuban.svg?branch=master)](https://travis-ci.org/oieioi/ketsuban)

# Ketsuban

Skip unlucky numbers for ActiveRecord surrogate key.

## Usage

Gemfile:

```ruby
gem 'ketsuban'
```

```ruby
class User < ApplicationRecord
  include Ketsuban
  unlucky_numbers [4, 5]
end

5.times.map { User.create.id }
# => [1, 2, 3, 6, 7]
```

or

```ruby
class User < ApplicationRecord
  include Ketsuban
  unlucky_numbers -> next_id { next_id.odd? }
end

5.times.map { User.create.id }
# => [2, 4, 6, 8, 10]
```



## TODO

- Support sqlite3

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

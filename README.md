[![https://badge.fury.io/rb/ketsuban.svg](https://badge.fury.io/rb/ketsuban.svg)](https://rubygems.org/gems/ketsuban)
[![Build Status](https://travis-ci.org/oieioi/ketsuban.svg?branch=master)](https://travis-ci.org/oieioi/ketsuban)
[![Coverage Status](https://coveralls.io/repos/github/oieioi/ketsuban/badge.svg?branch=master)](https://coveralls.io/github/oieioi/ketsuban?branch=master)

# ketsuban

Skip unlucky numbers for ActiveRecord surrogate key `id`.

## Usage

Gemfile:

```ruby
gem 'ketsuban'
```

Some Model:

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
  unlucky_numbers ->(next_id) { next_id.odd? }
end

5.times.map { User.create.id }
# => [2, 4, 6, 8, 10]
```

`unlucky_numbers` is aliased `ketsuban`

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

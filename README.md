# ketsuban

Skip unlucky number for ActiveRecord surrogate key

## USAGE

```
class User < ApplicationRecord
  include Ketsuban
  ketsuban [4, 13, 404, 503]
end
```

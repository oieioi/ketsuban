class User < ApplicationRecord
  include Ketsuban
  ketsuban [1, 3]
end

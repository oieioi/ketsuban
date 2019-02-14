require_relative './adapter'

module Ketsuban
  extend ActiveSupport::Concern

  UNLUCKY_NUMBERS = [4, 13, 42, 44, 400, 404, 444, 503]

  included do
    before_create do
      adapter = Adapter.get_adapter(self.class)
      next_id = adapter.fetch_next_id
      if UNLUCKY_NUMBERS.include?(next_id)
        self.id = adapter.generate_next_id(next_id)
        adapter.increment_sequence(self.id)
      end
    end
  end
end

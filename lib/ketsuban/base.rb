require_relative './adapter'
require_relative './class_methods'
require_relative './utils'

module Ketsuban
  extend ActiveSupport::Concern

  included do
    class << self
      include ClassMethod
    end

    before_create do
      adapter = Adapter.get_adapter(self.class)
      next_id = adapter.fetch_next_id
      if self.class.unlucky_numbers.include?(next_id)
        self.id = adapter.generate_next_id(next_id)
        adapter.increment_sequence(id)
      end
    end
  end
end

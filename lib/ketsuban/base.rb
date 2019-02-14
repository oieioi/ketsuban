require_relative './adapter'

module Ketsuban
  extend ActiveSupport::Concern

  included do
    @@unlucky_numbers = [4, 13, 42, 44, 400, 404, 444, 503]

    def self.unlucky_numbers(news = nil)
      return @@unlucky_numbers if news.nil?

      @@unlucky_numbers = news.sort
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

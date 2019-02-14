require_relative './adapter'
require_relative './utils'

module Ketsuban
  extend ActiveSupport::Concern

  module ClassMethod
    @unlucky_numbers = []

    def unlucky_numbers(news = nil)
      return @unlucky_numbers if news.nil?

      self.unlucky_numbers = news
    end

    def unlucky_numbers=(news)
      case news.class.to_s
      when 'Array' then @unlucky_numbers = news.sort
      when 'Proc' then @unlucky_numbers = Ketsuban::Utils.includenize!(news)
      else raise "Not support #{news.class} for ketsuban args"
      end
    end

    alias ketsuban unlucky_numbers
  end

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

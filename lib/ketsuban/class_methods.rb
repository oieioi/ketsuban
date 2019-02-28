require_relative './utils'

module Ketsuban
  module ClassMethod
    @unlucky_numbers = []

    def unlucky_numbers(numbers = nil)
      return @unlucky_numbers if numbers.nil?

      self.unlucky_numbers = numbers
    end

    def unlucky_numbers=(numbers)
      case numbers.class.to_s
      when 'Array' then @unlucky_numbers = numbers.sort
      when 'Proc' then @unlucky_numbers = Ketsuban::Utils.includenize!(numbers)
      else raise "Not support #{numbers.class} for ketsuban args"
      end
    end

    alias ketsuban unlucky_numbers
  end
end

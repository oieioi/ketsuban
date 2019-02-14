module Ketsuban
  module Adapter
    class AbstractAdapter
      def initialize(model_class)
        @model_class = model_class
      end

      def fetch_next_id
        maximum_id&.next || 1
      end

      def maximum_id
        @model_class.maximum(@model_class.primary_key)
      end

      def generate_next_id(now_id)
        loop do
          break unless Ketsuban::UNLUCKY_NUMBERS.include?(now_id)
          now_id = now_id + 1
        end
        now_id
      end

      def increment_sequence(now_id)
        raise 'Not implemented yet!'
      end
    end
  end
end

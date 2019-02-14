module Ketsuban
  module Adapter
    class AbstractAdapter
      def initialize(model_class)
        @model_class = model_class
      end

      def fetch_next_id
        @model_class.maximum(@model_class.primary_key)&.next || 1
      end

      def generate_next_id(now_id)
        loop do
          break unless @model_class.unlucky_numbers.include?(now_id)

          now_id += 1
        end
        now_id
      end

      def increment_sequence(_now_id)
        raise 'Not implemented yet!'
      end
    end
  end
end

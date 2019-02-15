require_relative './abstract_adapter'

module Ketsuban
  module Adapter
    class PostgreSQLAdapter < AbstractAdapter
      # @override
      def fetch_next_id
        last_value_result = @model_class
                            .connection
                            .execute("select last_value, is_called from #{@model_class.sequence_name}\;")

        last_value = last_value_result.getvalue(0, 0)
        is_called = last_value_result.getvalue(0, 1)

        if is_called
          last_value.next
        else
          last_value
        end
      end

      # @override
      def increment_sequence(now_id)
        @model_class.connection.set_pk_sequence!(@model_class.table_name, now_id)
      end
    end
  end
end

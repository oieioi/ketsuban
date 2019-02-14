require_relative './abstract_adapter'

module Ketsuban
  module Adapter
    class PostgreSQLAdapter < AbstractAdapter
      # @override
      def increment_sequence(now_id)
        @model_class.connection.set_pk_sequence!(@model_class.table_name, now_id)
      end
    end
  end
end

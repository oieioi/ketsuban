require_relative './abstract_adapter'

module Ketsuban
  module Adapter
    class SQLiteAdapter < AbstractAdapter
      # @override
      def fetch_next_id
        last_value_result = @model_class
                            .connection
                            .execute("select seq from sqlite_sequence where name = '#{@model_class.table_name}'")
                            .first

        if last_value_result
          last_value_result["seq"] + 1
        else
          1
        end
      end

      # @override
      def increment_sequence(_now_id)
        # do nothing
        nil
      end
    end
  end
end

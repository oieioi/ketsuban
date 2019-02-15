require_relative './abstract_adapter'

module Ketsuban
  module Adapter
    class Mysql2Adapter < AbstractAdapter
      # @override
      def fetch_next_id
        [max_id_now + 1, auto_incremental_id].max
      end

      # @override
      def increment_sequence(_now_id)
        # do nothing
        nil
      end

      private

      def auto_incremental_id
        @model_class
          .connection
          .execute("select auto_increment from information_schema.tables where table_name = '#{@model_class.table_name}'")
          .first
          .first
      end

      def max_id_now
        @model_class.maximum(:id).presence || 0
      end
    end
  end
end

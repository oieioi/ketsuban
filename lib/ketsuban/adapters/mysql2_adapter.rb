require_relative './abstract_adapter'

module Ketsuban
  module Adapter
    class Mysql2Adapter < AbstractAdapter
      # @override
      def increment_sequence(_now_id)
        # do nothing
        nil
      end
    end
  end
end

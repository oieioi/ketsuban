require_relative './adapters/postgresql_adapter'

module Ketsuban
  module Adapter
    def get_adapter(model_class)
      case ActiveRecord::Base.connection.adapter_name.downcase
      when 'postgresql'
        PostgreSQLAdapter.new(model_class)
      when 'mysql'
      when 'sqlite3'
      else raise 'Not Implemented Yet'
      end
    end
    module_function :get_adapter
  end
end

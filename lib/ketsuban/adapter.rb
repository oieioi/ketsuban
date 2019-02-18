require_relative './adapters/postgresql_adapter'
require_relative './adapters/mysql2_adapter'
require_relative './adapters/sqlite_adapter'

module Ketsuban
  module Adapter
    module_function

    def get_adapter(model_class)
      adapter_name = model_class.connection.adapter_name
      const_get("#{adapter_name}Adapter").new(model_class)
    rescue StandardError => e
      raise 'Not Found adapter', e
    end
  end
end

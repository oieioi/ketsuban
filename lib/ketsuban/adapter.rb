require_relative './adapters/postgresql_adapter'

module Ketsuban
  module Adapter
    module_function

    def get_adapter(model_class)
      adapter_name = ActiveRecord::Base.connection.adapter_name
      const_get("#{adapter_name}Adapter").new(model_class)
    rescue StandardError => e
      raise 'Not Found adapter', e
    end
  end
end

require_relative './adapters/postgresql_adapter'

module Ketsuban
  module Adapter
    def get_adapter(model_class)
      adapter_name = ActiveRecord::Base.connection.adapter_name
      const_get("#{adapter_name}Adapter").new(model_class)
    rescue => e
      raise 'Not Found adapter', e
    end
    module_function :get_adapter
  end
end

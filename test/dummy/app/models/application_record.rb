class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    def use_mysql
      config = YAML.load_file(Rails.root.join("config", "database_mysql.yml"))[Rails.env]
      ActiveRecord::Base.establish_connection(config)
    end

    def use_postgresql
      config = YAML.load_file(Rails.root.join("config", "database.yml"))[Rails.env]
      ActiveRecord::Base.establish_connection(config)
    end

    def use_sqlite
      config = YAML.load_file(Rails.root.join("config", "database_sqlite.yml"))[Rails.env]
      ActiveRecord::Base.establish_connection(config)
    end
  end
end

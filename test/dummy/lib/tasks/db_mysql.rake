namespace :db_mysql do
  desc "mysql db configuration"
  task :set_db_config do
    ENV['SCHEMA'] = 'db/schema_mysql.rb'
    Rails.application.config.paths['config/database'] = ['config/database_mysql.yml']
  end

  task drop: :set_db_config do
    Rake::Task['db:drop'].invoke
  end

  task create: :set_db_config do
    Rake::Task['db:create'].invoke
  end

  task migrate: :set_db_config do
    Rake::Task['db:migrate'].invoke
  end

  task rollback: :set_db_config do
    Rake::Task['db:rollback'].invoke
  end
end

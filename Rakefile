task :environment do
  require File.expand_path('../config/boot', __FILE__) 
end

namespace :db do
  
  def migration_path
    File.expand_path('db/migrate', APP_ROOT)
  end

  desc 'migrate the database to the latest version'
  task :migrate => :environment do
    ActiveRecord::Migrator.migrate(migration_path, ENV['VERSION'] ? ENV['VERSION'].to_i : nil)
  end

  namespace :migrate do
    desc 'rerun the most recent database migration'
    task :redo => :environment do
      ActiveRecord::Migrator.rollback(migration_path)
      ActiveRecord::Migrator.migrate(migration_path)
    end

    desc 'roll the database back <STEPS> migrations (default: STEPS=1)'
    task :rollback => :environment do
      ActiveRecord::Migrator.rollback(migration_path, ENV['STEPS'] || 1)
    end
  end
end


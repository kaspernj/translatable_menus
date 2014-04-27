namespace :translatable_menus do
  task "install" => :environment do
    migrations_path = "#{Rails.root}/db/migrate"
    
    migration_exists = false
    Dir.foreach(migrations_path) do |file|
      if file.match(/^(\d+)_create_translatable_menus_translatable_menus\.rb$/)
        migration_exists = true
        break
      end
    end
    
    if migration_exists
      puts "Migration already there - skipping creation of migration."
    else
      time = Time.now
      filepath = "#{migrations_path}/#{time.strftime("%Y%m%d%H%M%S")}_create_translatable_menus_translatable_menus.rb"
      original_migration = "#{File.dirname(__FILE__)}/../../db/migrate/20140427113944_create_translatable_menus_translatable_menus.rb"
      
      puts "Installing migration."
      raise "Original migration doesnt exist: #{original_migration}" unless File.exists?(original_migration)
      
      File.open(filepath, "w") do |fp|
        fp.write(File.read(original_migration))
      end
    end
  end
end

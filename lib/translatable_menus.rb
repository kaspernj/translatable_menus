require_relative "translatable_menus/engine"
require "string-cases"
require_relative "translatable_menus/active_admin_integrator"
require_relative "../app/models/translatable_menus/translatable_menu.rb"

# Add the translation files to the I18n load path.
locales_path = Dir["#{File.dirname(__FILE__)}/../config/locales/**/*.yml"]
I18n.load_path += locales_path

module TranslatableMenus
end

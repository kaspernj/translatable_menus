class CreateTranslatableMenusTranslatableMenus < ActiveRecord::Migration
  def up
    create_table :translatable_menus_translatable_menus do |t|
      t.integer :menu_id
      t.string :identifier
      t.string :default_title
      t.string :default_url
      t.boolean :default_active, :default => true
      t.integer :sort_number
      t.string :http_method, :default => "get"
      t.boolean :require_not_signed_in
      t.boolean :require_signed_in
      t.text :require_callbacks

      t.timestamps
    end
    
    add_index :translatable_menus_translatable_menus, :menu_id, :name => "menu_id"
    add_index :translatable_menus_translatable_menus, :identifier, :name => "identifier"
    
    ::TranslatableMenus::TranslatableMenu.create_translation_table!(
      :title => :string,
      :url => :text,
      :active => :string
    )
  end
  
  def down
    drop_table :translatable_menus_translatable_menus
    ::TranslatableMenus::TranslatableMenu.drop_translation_table!
  end
end

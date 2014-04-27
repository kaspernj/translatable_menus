class TranslatableMenus::ActiveAdminIntegrator
  def self.integrate!
    ActiveAdmin.register TranslatableMenus::TranslatableMenu do
      permit_params :identifier, :sort_number, :menu_id, :http_method, :require_not_signed_in, :require_signed_in,
        :translations_attributes => [:id, :locale, :title, :url]
      
      index do |f|
        selectable_column
        id_column
        column :title
        column :menu
        translation_status
        default_actions
      end
      
      form do |f|
        f.inputs do
          f.input :menu_id, :as => :select, :collection => (f.object.menu.present? ? f.object.menu.menus : TranslatableMenus::TranslatableMenu.where("translatable_menus_translatable_menus.menu_id IS NULL"))
          f.input :identifier
          f.input :sort_number
          f.input :default_url
          f.input :http_method
          f.input :require_not_signed_in
          f.input :require_signed_in
        end
        
        f.translated_inputs do |tf|
          tf.input :title
          tf.input :url
        end
        
        f.actions
      end
    end
  end
end

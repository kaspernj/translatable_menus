class TranslatableMenus::ActiveAdminIntegrator
  def self.integrate!
    ActiveAdmin.register TranslatableMenus::TranslatableMenu do
      permit_params :identifier, :sort_number, :menu_id, :http_method, :require_not_signed_in, :require_signed_in, :require_callbacks,
        :default_url, :default_active, :translations_attributes => [:id, :locale, :title, :url, :active]
      
      index do |f|
        selectable_column
        id_column
        column :title
        column :default_active
        column :menu
        translation_status
        default_actions
      end
      
      form do |f|
        f.inputs do
          f.input :menu_id, :as => :select, :collection => TranslatableMenus::TranslatableMenu.all
          f.input :identifier
          f.input :sort_number
          f.input :default_url
          f.input :default_active
          f.input :http_method
          f.input :require_not_signed_in
          f.input :require_signed_in
          f.input :require_callbacks, :as => :string
        end
        
        f.translated_inputs do |tf|
          tf.input :title
          tf.input :active, :as => :select, :collection => {t("yes") => 1, t("no") => 0}
          tf.input :url, :as => :string
        end
        
        f.actions
      end
    end
  end
end

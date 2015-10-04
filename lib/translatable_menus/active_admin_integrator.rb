class TranslatableMenus::ActiveAdminIntegrator
  def self.integrate!
    ActiveAdmin.register TranslatableMenus::TranslatableMenu do
      permit_params :identifier, :sort_number, :menu_id, :http_method, :require_not_signed_in, :require_signed_in, :require_callbacks,
        :default_url, :default_active, :default_title, :translations_attributes => [:id, :locale, :title, :url, :active]

      filter :default_title
      filter :identifier

      index do |f|
        selectable_column
        id_column
        column(:title){ |menu| menu.title_to_use }
        column :default_active
        column :menu
        translation_status
        actions
      end

      form do |f|
        f.semantic_errors *f.object.errors.keys

        f.inputs do
          f.input :menu_id, as: :select, collection: TranslatableMenus::TranslatableMenu.all.map{ |menu| [menu.title_to_use, menu.id] }
          f.input :identifier
          f.input :sort_number
          f.input :default_title
          f.input :default_url
          f.input :default_active
          f.input :http_method
          f.input :require_not_signed_in
          f.input :require_signed_in
          f.input :require_callbacks, as: :string
        end

        f.translated_inputs do |tf|
          tf.input :title
          tf.input :active, as: :select, collection: {t("yes") => 1, t("no") => 0}
          tf.input :url, as: :string
        end

        f.actions
      end

      show do
        attributes_table do
          row :id
          row :menu
          row :identifier
          row :default_title
          row :default_url
          row :default_active
          row :sort_number
          row :http_method
          row :require_not_signed_in
          row :require_signed_in
          row :require_callbacks
          row :created_at
          row :updated_at

          I18n.available_locales.each do |locale|
            row(:locale){ locale }

            I18n.with_locale locale do
              row :title
              row :active
              row :url
            end
          end
        end
      end

      # Fixes a bug where attributes wasn't assigned correctly - kaspernj
      before_save do |menu|
        menu.assign_attributes(permitted_params[:translatable_menu])
      end
    end
  end
end

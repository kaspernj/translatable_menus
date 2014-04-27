class GettextSimpleRails::UserModelTranslations
  def self.attribute_translations
    puts _('models.attributes.user.id')
    puts _('models.attributes.user.email')
    puts _('models.attributes.user.encrypted_password')
    puts _('models.attributes.user.reset_password_token')
    puts _('models.attributes.user.reset_password_sent_at')
    puts _('models.attributes.user.remember_created_at')
    puts _('models.attributes.user.sign_in_count')
    puts _('models.attributes.user.current_sign_in_at')
    puts _('models.attributes.user.last_sign_in_at')
    puts _('models.attributes.user.current_sign_in_ip')
    puts _('models.attributes.user.last_sign_in_ip')
    puts _('models.attributes.user.created_at')
    puts _('models.attributes.user.updated_at')
  end

  def self.relationship_translations
  end

  def self.paperclip_attachments
  end

  def self.model_name
    puts _('models.name.user.one')
    puts _('models.name.user.other')
  end
end

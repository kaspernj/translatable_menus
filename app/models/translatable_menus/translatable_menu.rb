require "activeadmin-globalize"

class TranslatableMenus::TranslatableMenu < ActiveRecord::Base
  translates :title, :url
  
  has_many :menus, :class_name => "TranslatableMenu", :foreign_key => :menu_id
  belongs_to :menu, :class_name => "TranslatableMenu", :foreign_key => :menu_id
  
  active_admin_translates :title, :url
  accepts_nested_attributes_for :translations
  
  def url_to_use
    if url
      url_str = url
    elsif default_url
      url_str = default_url
    else
      raise "No URL has been set for this menu item."
    end
    
    url_str = url_str.gsub("%{locale}", I18n.locale.to_s)
    
    return url_str
  end
end

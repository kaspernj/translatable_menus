class TranslatableMenus::TranslatableMenu < ActiveRecord::Base
  translates :title, :url, :active

  has_many :menus, :class_name => "TranslatableMenu", :foreign_key => :menu_id
  belongs_to :menu, :class_name => "TranslatableMenu", :foreign_key => :menu_id

  accepts_nested_attributes_for :translations

  def url_to_use
    if url.present?
      url_str = url
    elsif default_url.present?
      url_str = default_url
    else
      raise "No URL has been set for this menu item."
    end

    url_str = url_str.gsub("%{locale}", I18n.locale.to_s)

    return url_str
  end

  def active_to_use?
    if active == "1"
      return true
    elsif active == "0"
      return false
    elsif default_active?
      return true
    else
      return false
    end
  end

  def title_to_use
    title.presence || default_title
  end
end

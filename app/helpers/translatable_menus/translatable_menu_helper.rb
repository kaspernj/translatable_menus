module TranslatableMenus::TranslatableMenuHelper
  def should_show_menu?(menu)
    # TODO: Implement callbacks!
    
    if !menu.url && !menu.default_url
      return false
    elsif menu.require_not_signed_in? && signed_in?
      return false
    elsif menu.require_signed_in? && !signed_in?
      return false
    else
      return true
    end
  end
end

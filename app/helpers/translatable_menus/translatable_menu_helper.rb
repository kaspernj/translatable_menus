module TranslatableMenus::TranslatableMenuHelper
  def should_show_menu?(menu)
    if !menu.url && !menu.default_url
      return false
    elsif !menu.active_to_use?
      return false
    elsif menu.require_not_signed_in? && signed_in?
      return false
    elsif menu.require_signed_in? && !signed_in?
      return false
    end
    
    # Check that callbacks are ok.
    menu.require_callbacks.to_s.split(",").map{ |callback| callback.to_s.strip }.each do |callback|
      next if callback.empty?
      result = TranslatableMenus::Connections.instance.call(callback, self, menu)
      return false if result != true
    end
    
    return true
  end
end

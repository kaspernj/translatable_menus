[![Code Climate](https://codeclimate.com/github/kaspernj/translatable_menus/badges/gpa.svg)](https://codeclimate.com/github/kaspernj/translatable_menus)
[![Test Coverage](https://codeclimate.com/github/kaspernj/translatable_menus/badges/coverage.svg)](https://codeclimate.com/github/kaspernj/translatable_menus)

# TranslatableMenus

## Install & setup

First bundle it like this in your Gemfile:
```ruby
gem 'translatable_menus'
```

Then integrate it with ActiveAdmin through "/app/admin/translatable_menus.rb":
```ruby
TranslatableMenus::ActiveAdminIntegrator.integrate!
```

Make a helper something like this in "/app/helpers/application_helper.rb":
```ruby
module ApplicationHelper
  def top_menu_items
    topmenu_items = []

    if main_menu = TranslatableMenus::TranslatableMenu.find_by(identifier: "main")
      main_menu.menus.order(:sort_number).each do |menu_item|
        next unless should_show_menu?(menu_item)
        if menu_item.http_method == "get" || !menu_item.http_method.present?
          http_method = nil
        else
          http_method = menu_item.http_method
        end

        topmenu_items << link_to(menu_item.title, menu_item.url_to_use, method: http_method)
      end
    end

    return topmenu_items
  end
end
```

In your lauout you can iterate over the menu-items like this:
```erb
<% top_menu_items.each do |link| %>
  <span class="link"><%= link %></span>
<% end %>
```


# License

This project rocks and uses MIT-LICENSE.

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  mount TranslatableMenus::Engine => "/translatable_menus"
end

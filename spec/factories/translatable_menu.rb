FactoryGirl.define do
  factory :translatable_menu, :class => "TranslatableMenus::TranslatableMenu" do
    sort_number 1
    default_url "/frontpage/index"
  end
end

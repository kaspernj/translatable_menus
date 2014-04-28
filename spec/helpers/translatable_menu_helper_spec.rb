require "spec_helper"

describe TranslatableMenus::TranslatableMenuHelper do
  include Devise::TestHelpers
  
  context "#should_show_menu?" do
    let(:user){ create :user }
    let(:menu_require_signed_in){ create :translatable_menu, :require_signed_in => true }
    let(:menu_require_not_signed_in){ create :translatable_menu, :require_not_signed_in => true }
    let(:menu_without_urls){ create :translatable_menu, :default_url => nil }
    let(:menu_with_callbacks){ create :translatable_menu, :require_callbacks => "is_admin, is_7_years_old" }
    let(:menu){ create :translatable_menu }
    
    it "only not show menu that requires signed in when not signed in" do
      menu_require_signed_in.require_signed_in.should eq true
      helper.should_show_menu?(menu_require_signed_in).should eq false
    end
    
    it "should show menu that requires signed in when signed in" do
      sign_in user
      menu_require_signed_in.require_signed_in.should eq true
      helper.should_show_menu?(menu_require_signed_in).should eq true
    end
    
    it "should show menu that that requires not signed when not signed in" do
      menu_require_not_signed_in.require_not_signed_in?.should eq true
      helper.should_show_menu?(menu_require_not_signed_in).should eq true
    end
    
    it "should not show menu that requires not signed in when signed in" do
      sign_in user
      menu_require_not_signed_in.require_not_signed_in?.should eq true
      helper.should_show_menu?(menu_require_not_signed_in).should eq false
    end
    
    it "should never show menus without urls" do
      helper.should_show_menu?(menu_without_urls).should eq false
      sign_in user
      helper.should_show_menu?(menu_without_urls).should eq false
    end
    
    it "calls require callbacks" do
      TranslatableMenus::Connections.instance.clear
      
      $is_admin_called = false
      TranslatableMenus::Connections.instance.connect("is_admin") do
        $is_admin_called = true
        false
      end
      
      $is_7_years_old_called = false
      TranslatableMenus::Connections.instance.connect("is_7_years_old") do
        $is_7_years_old_called = true
        true
      end
      
      helper.should_show_menu?(menu_with_callbacks).should eq false
      $is_admin_called.should eq true
    end
    
    it "doesnt show when active as default but not active in translations" do
      menu.default_active = true
      I18n.with_locale(:en){ menu.active = "0" }
      I18n.with_locale(:da){ menu.active = "1" }
      I18n.with_locale(:de){ menu.active = nil }
      menu.save!
      
      I18n.with_locale(:en){ helper.should_show_menu?(menu).should eq false }
      I18n.with_locale(:da){ helper.should_show_menu?(menu).should eq true }
      I18n.with_locale(:de){ helper.should_show_menu?(menu).should eq true }
    end
  end
end

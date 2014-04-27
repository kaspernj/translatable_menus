require "spec_helper"

describe TranslatableMenus::TranslatableMenuHelper do
  include Devise::TestHelpers
  
  context "#should_show_menu?" do
    let(:user){ create :user }
    let(:menu_require_signed_in){ create :translatable_menu, :require_signed_in => true }
    let(:menu_require_not_signed_in){ create :translatable_menu, :require_not_signed_in => true }
    let(:menu_without_urls){ create :translatable_menu, :default_url => nil }
    
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
  end
end

require "spec_helper"

describe TranslatableMenus::TranslatableMenu do
  let!(:menu){ create :translatable_menu }
  
  it "supports multiple languages" do
    I18n.with_locale(:da){ menu.title = "Forside" }
    I18n.with_locale(:en){ menu.title = "Frontpage" }
    
    menu.save!
    
    I18n.with_locale(:da){ menu.title.should eq "Forside" }
    I18n.with_locale(:en){ menu.title.should eq "Frontpage" }
  end
  
  it "doesnt override defaults with empty strings" do
    I18n.with_locale(:en) do
      menu.default_url = "/test"
      menu.url = ""
      menu.save!
      
      menu.url_to_use.should eq "/test"
    end
  end
end

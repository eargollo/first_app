require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "Ruby on Rails Tutorial Sample App")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end    
  
  {"help" => "Help", "about" => "About Us"}.each do |tpage, ttitle|
    describe ttitle do
      
      it "should have the h1 '#{ttitle}'" do
        visit "/static_pages/#{tpage}"
        page.should have_selector('h1', :text => ttitle)
      end
      
      
      it "should have the title '#{ttitle}'" do
        ttitle = "Home" if tpage == "home"
        visit "/static_pages/#{tpage}"
        page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | #{ttitle}")
      end
    end
  end
  
end

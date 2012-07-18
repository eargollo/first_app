require 'spec_helper'

describe "StaticPages" do
  
  {"home" => "Sample App", "help" => "Help", "about" => "About Us"}.each do |tpage, ttitle|
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

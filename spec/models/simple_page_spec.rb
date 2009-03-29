require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
# require File.expand_path(File.dirname(__FILE__) + '/../../../app/controllers/pliki_simple_page/simple_pages_controller')

module PlikiSimplePage
  describe SimplePage, "when being created" do
    it "should create a link to a new page if wikilink is found in body" do
      page = SimplePage.new(:plugin_instance => @instance, :body => "[[Another Page]]")
      page.body.should == "<p><a href=\"/pages/another_page\">Another Page</a></p>"
    end
    
  end
end
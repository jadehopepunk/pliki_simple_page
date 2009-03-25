require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../app/controllers/pliki_simple_page/simple_pages_controller')

module PlikiSimplePage
  describe SimplePagesController, "when showing page" do
    
    it "should redirect to edit if no simple page exists" do
      get :show
      response.should redirect_to("/prefix/simple_page/edit")
    end

    it "should load simple page for current plugin instance" do
      page = page_for_current_instance
      get :show
      assigns(:simple_page).should == page
    end
        
    it "should return success" do
      page = page_for_current_instance
      get :show
      response.should be_success
    end

  end
end
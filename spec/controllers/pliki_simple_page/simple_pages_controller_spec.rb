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
        
    it "should render page" do
      page = page_for_current_instance
      get :show
      response.should be_success
    end
  end
  
  describe SimplePagesController, "when editing page" do
    it "should render page" do
      get :edit
      response.should be_success
    end
  end
  
  describe SimplePagesController, "when creating or updating page" do
    it "should render edit template if data is invalid" do
      post :create, :simple_page => {}
      response.should render_template('edit')
    end
    
    it "should redirect to show if data is valid" do
      post :create, :simple_page => valid_data
      response.should redirect_to("/prefix/simple_page")
    end
    
    it "should create new simple page if none exists" do
      post :create, :simple_page => valid_data

      assigns(:simple_page).should_not be_nil
      assigns(:simple_page).body(:plain).should == valid_data['body']
    end
  
    it "should update existing simple page with new data" do
      existing_page = Factory.create(:simple_page, :plugin_instance => @instance)
      post :create, :simple_page => valid_data('body' => 'new text')

      assigns(:simple_page).should == existing_page
      assigns(:simple_page).body(:plain).should == 'new text'
    end
    
    def valid_data(options = {})
      Factory.build(:simple_page, options).attributes
    end
  end
end
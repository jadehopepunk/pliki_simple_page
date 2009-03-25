require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../app/controllers/pliki_simple_page/simple_pages_controller')

module PlikiSimplePage
  describe SimplePagesController do
    
    before(:each) do
      @instance = Factory.build(:plugin_instance, :plugin_name => 'pliki_simple_page')
      controller.plugin_instance = @instance
      controller.send(:initialize_current_url)
    end

    it "should have some tests" do
      controller.should be_an_instance_of(SimplePagesController)
    end

  end
end
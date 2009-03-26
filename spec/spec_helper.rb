ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")
require 'spec'
require 'spec/rails'
require File.expand_path(File.dirname(__FILE__) + "../../../plugin_instances/spec/plugin_instances_spec_helper.rb")
require File.expand_path(File.dirname(__FILE__) + "/factories.rb")

module SimplePageSpecHelpers
  def page_for_current_instance
    Factory.create(:simple_page, :plugin_instance => @instance) 
  end
end

Spec::Runner.configure do |config|
  # If you're not using ActiveRecord you should remove these
  # lines, delete config/database.yml and disable :active_record
  # in your config/boot.rb
  # config.use_transactional_fixtures = true
  # config.use_instantiated_fixtures  = false
  # config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

  config.include(SimplePageSpecHelpers)

  config.before(:all) do
    self.class.integrate_views    
  end
  
  config.before(:each) do
    @instance = Factory.build(:plugin_instance, :plugin_name => 'pliki_simple_page')
    @instance.stub!(:id).and_return(12)
    @instance.stub!(:new_record?).and_return(false)

    controller.plugin_instance = @instance
    controller.parent_route = PluginInstances::MockRoute.new
    controller.send(:initialize_current_url)
  end

end

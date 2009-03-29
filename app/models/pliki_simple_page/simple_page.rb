#   t.text :body
#   t.integer :plugin_instance_id

module PlikiSimplePage
  class SimplePage < ActiveRecord::Base
    belongs_to :plugin_instance
    
    acts_as_textiled :body
    can_contain_wikilinks :body
    
    validates_presence_of :body, :plugin_instance
      
      
  end
end
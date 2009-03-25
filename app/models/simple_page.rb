#   t.text :body
#   t.integer :plugin_instance_id

class SimplePage < ActiveRecord::Base
  belongs_to :plugin_instance

  acts_as_textiled :body
  
  validates_presence_of :body, :plugin_instance
  
  
end
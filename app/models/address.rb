class Address < ApplicationRecord
  include Fae::BaseModelConcern
  
    belongs_to :client
  
    validates_presence_of :street
    
    def fae_display_field
      id
    end
  
    def self.for_fae_index
      order(:id)
    end
end
  
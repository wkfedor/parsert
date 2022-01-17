class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  field :state, type: String
  field :district, type: String
 # belongs_to :user, inverse: :location
end

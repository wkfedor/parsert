class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  #store_in collection: "project"

  field :name, type: String
  field :dictionars, type: Array
  #has_and_belongs_to_many :dictionars

end


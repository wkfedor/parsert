class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  #store_in collection: "project"

  field :name, type: String
  field :work, type: String
  field :masslink, type: String
  field :dictionar, type: Array

  
  #has_and_belongs_to_many :dictionars
  #belongs_to :dictionar
end


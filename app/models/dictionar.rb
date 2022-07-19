class Dictionar
  include Mongoid::Document
  include Mongoid::Timestamps
  field :ves, type: Integer
  field :word, type: String
  field :comment, type: String
  field :project, type: Array
  #has_and_belongs_to_many :projects
  #embeds_many :project
  
end
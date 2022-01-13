class Dictionar
  include Mongoid::Document
  include Mongoid::Timestamps
  field :ves, type: Integer
  field :word, type: String
  field :comment, type: String
  #has_and_belongs_to_many :projects
end
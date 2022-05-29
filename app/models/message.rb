class Message
  include Mongoid::Document
  include Mongoid::Timestamps 
  field :url, type: String
  field :head, type: String
  field :pr, type: Integer
  field :text, type: String
  field :link, type: String
  field :linksx, type: String
  field :dictionary, type: String
  field :photo, type: String
  field :phone, type: String
  field :profile, type: String
  field :open, type: Boolean
  field :mainproject, type: Array
  field :ves, type: Integer 
end
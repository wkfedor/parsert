class User
  include Mongoid::Document
  include Mongoid::Timestamps
  #store_in collection: "user"             # не понял смысла конструкции
  field :name, type: String
  field :number, type: String
  belongs_to :location , class_name: Location  #  class_name: Location в моем случае не обязательно

end

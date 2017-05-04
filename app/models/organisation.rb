class Organisation < Account
  include Mongoid::Document

  has_many :cards
end

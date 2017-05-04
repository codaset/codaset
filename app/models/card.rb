require 'autoinc'

class Card
  include Mongoid::Document
  include Mongoid::Autoinc

  field :title, type: String
  field :description, type: String
  field :number, type: Integer

  increments :number, scope: :accountable_id

  belongs_to :accountable, polymorphic: true
  belongs_to :creator, class_name: 'User', inverse_of: :owned_cards

  validates :title, presence: true
  validates :description, presence: true

  def to_i
    number
  end

  def to_param
    number
  end

  def to_s
    title
  end
end

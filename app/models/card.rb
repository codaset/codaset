require 'autoinc'

class Card
  include Mongoid::Document
  include Mongoid::Autoinc

  field :title, type: String
  field :description, type: String
  field :number, type: Integer

  increments :number, scope: :organisation_id

  belongs_to :organisation

  validates :title, presence: true
  validates :description, presence: true

  def to_i
    number
  end

  def to_s
    title
  end
end

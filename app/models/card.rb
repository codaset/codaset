require 'autoinc'

class Card
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  include Mongoid::Autoinc

  field :t, as: :title, type: String
  field :d, as: :description, type: String
  field :number, type: Integer
  field :closed, type: Boolean, default: false

  increments :number, scope: :organisation_id

  belongs_to :organisation
  belongs_to :creator, class_name: 'User', inverse_of: :created_cards
  has_and_belongs_to_many :assignees, class_name: 'User', inverse_of: :assigned_cards

  validates :title, :description, presence: true

  def to_param
    number
  end

  def to_s
    title
  end
end

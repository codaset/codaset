require 'autoinc'

class Card
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  include Mongoid::Autoinc

  # State pairs, where the key is the name, and the value is whether the card should be closed.
  STATES = {
    backlog: false,
    dev_in_progress: false,
    dev_complete: false,
    qa_in_progress: false,
    qa_approved: false,
    resolved: true,
    closed: true
  }.freeze

  field :t, as: :title, type: String
  field :d, as: :description, type: String
  field :n, as: :number, type: Integer
  field :c, as: :closed, type: Boolean, default: false
  field :s, as: :state, type: String, default: STATES.first.first

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

  def self.group_by_state
    query = where(nil).group(_id: '$s', :count.sum => 1, :cards.push => '$$ROOT')
    collection.aggregate(query.pipeline)
  end
end

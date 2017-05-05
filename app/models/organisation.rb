class Organisation
  include Mongoid::Document

  field :name, type: String

  validates :name, presence: true

  has_many :cards

  def to_s
    name
  end
end

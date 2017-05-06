class Organisation
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field :name, type: String

  validates :name, presence: true

  embeds_many :memberships, store_as: :m do
    def owners
      where access_level: 'owner'
    end
  end
  has_many :cards

  accepts_nested_attributes_for :memberships

  def to_s
    name
  end

  def members
    @members ||= User.in(id: memberships.pluck(:user_id))
  end

  def owners
    @owners ||= User.in(id: memberships.owners.pluck(:user_id))
  end
end

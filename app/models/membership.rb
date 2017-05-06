class Membership
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  # Owner or member; must always be at least one owner
  field :al, as: :access_level, type: String, default: 'member'
  field :u, as: :user_id, type: BSON::ObjectId

  embedded_in :organisation
end

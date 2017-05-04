class User < Account
  include Mongoid::Document

  devise :omniauthable, :rememberable, :trackable, omniauth_providers: [:github]

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  has_many :cards, as: :accountable
  has_many :created_cards, class_name: 'Card', inverse_of: :creator

  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_create_by!(github_id: auth_hash[:uid]) do |u|
      u.username = auth_hash[:extra][:raw_info][:login]
      u.email = auth_hash[:info][:email]
    end
  end
end

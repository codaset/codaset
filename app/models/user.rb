class User
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

  field :ghid, as: :github_id, type: Integer
  field :u, as: :username, type: String
  field :e, as: :email, type: String

  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_create_by!(github_id: auth_hash[:uid]) do |u|
      u.username = auth_hash[:extra][:raw_info][:login]
      u.email = auth_hash[:info][:email]
    end
  end

  def to_s
    username
  end
end
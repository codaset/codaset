class User
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  devise :omniauthable, :rememberable, :trackable, omniauth_providers: [:github]

  field :remember_created_at,           type: Time
  field :sign_in_count,                 type: Integer, default: 0
  field :current_sign_in_at,            type: Time
  field :last_sign_in_at,               type: Time
  field :current_sign_in_ip,            type: String
  field :last_sign_in_ip,               type: String
  field :ght, as: :github_access_token, type: String
  field :ghid, as: :github_id,          type: Integer
  field :u, as: :username,              type: String
  field :e, as: :email,                 type: String

  # has_many :memberships
  has_many :created_cards, class_name: 'Card', inverse_of: :creator
  has_and_belongs_to_many :assigned_cards, class_name: 'Card', inverse_of: :assignees

  validates :github_id, :username, uniqueness: true

  def self.find_or_create_or_update_from_auth_hash(auth_hash)
    record = find_or_initialize_by(github_id: auth_hash[:uid])
    record.tap do |u|
      u.username = auth_hash[:extra][:raw_info][:login]
      u.email = auth_hash[:info][:email]
      u.github_access_token = auth_hash[:credentials][:token]
      u.save!
    end
  end

  def to_s
    username
  end

  def to_param
    username
  end

  # Returns an Array of organisation records that this User is a member of.
  def organisations
    @organisations ||= Organisation.where('m.u' => id)
  end
end

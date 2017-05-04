class Account
  include Mongoid::Document

  field :ghid, as: :github_id, type: Integer
  field :u, as: :username, type: String
  field :e, as: :email, type: String

  validates :github_id, :username, uniqueness: true

  def to_s
    username
  end

  def to_param
    username
  end
end

class Merchant < ActiveRecord::Base
  has_many :products

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :uid, :provider, presence: true

  def self.build_from_github(auth_hash)
    user       = Merchant.new
    user.uid   = auth_hash[:uid]
    user.provider = 'github'
    user.username  = auth_hash['info']['name']
    user.email = auth_hash['info']['email']

    return user
  end
end

class User <ApplicationRecord
  has_secure_password
  has_many :favorites

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, on: :create
  validates_presence_of :api_key, on: :create

end

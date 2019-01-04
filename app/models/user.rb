class User <ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, on: :create
  
  def token
    SecureRandom.urlsafe_base64.to_s
  end

end

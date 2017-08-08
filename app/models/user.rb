class User < ActiveRecord::Base
  has_secure_password
  has_many :review

  validates :password, presence: true, confirmation: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    puts("rohit"+email+"dhand")
    puts("rohit"+email.strip+"dhand")
    @user = User.find_by_email(email.strip.downcase)
    puts @user.inspect
  
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end

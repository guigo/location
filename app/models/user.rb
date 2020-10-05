class User < ApplicationRecord
  enum status: { 'active' => 0, 'blocked' => 1 }
  enum role: { 'admin' => 0, 'regular' => 1 }

  has_many :reserved_cars

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, :email, :document, presence: true

  # after_create :send_welcome_mail

  attribute :role, :integer, default: 1
  	
  has_one_attached :avatar

  def admin?
    role == 'admin'
  end

  private

  def send_welcome_mail
    token, enc = Devise.token_generator.generate(User, :reset_password_token)
    self.reset_password_token   = enc
    self.reset_password_sent_at = Time.now.utc
    save(validate: false)
    UserMailer.with(user: self, token: token).welcome.deliver_now
  end
end

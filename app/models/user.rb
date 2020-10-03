class User < ApplicationRecord

  enum role: { 'admin' => 0, 'regular' => 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true

  attribute :role, :integer, default: 1

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

class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :username, presence: true

  validates :password, presence: { on: :create }, length: { minimum: 2, allow_blank: true }

  validates_presence_of :password_confirmation, if: :password_digest_changed?
end

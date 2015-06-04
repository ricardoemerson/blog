# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  full_name              :string
#  location               :string
#  bio                    :text
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :rememberable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  has_many :posts
  has_many :comments

  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates :email, :full_name, :location, presence: true
  # validates :bio, length: { minimum: 10 }, allow_blank: false
  validate :email_format

  private

  # Essa validação pode ser representada da seguinte forma:
  # validates_format_of :email, with: EMAIL_REGEXP
  def email_format
    errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :listings
  has_many :notifications
  validates :email, format: { with: /.*(@u.nus.edu|nus.edu.sg)/i }
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :chirps, dependent: :destroy 
	has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
	has_many :passive_relationshsips, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationshsips, source: :follower
# 	validates_presence_of :email, :username, :password 
# 	validates_uniqueness_of :email, :username
# 	validates :username, length: { minimum: 3, maximum: 30 }
# 	validates :password_confirmation, on: :create

	end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Relations ##
  belongs_to :team
  has_many :competencies
  has_many :logs
  has_many :team_requests

  ## Image uploader ##
  mount_uploader :avatar, ImageUploader

end


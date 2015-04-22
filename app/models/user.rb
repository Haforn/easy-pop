class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Relations ##
  belongs_to :team
  has_many :competencies, dependent: :destroy
  has_many :logs, dependent: :destroy
  has_many :team_requests, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  ## Image uploader ##
  mount_uploader :avatar, ImageUploader

end


class Trainer < ApplicationRecord
    has_many :workouts, dependent: :destroy
    has_many :memberships, through: :workouts
  
    validates :name, presence: true
    validates :specialty, presence: true
    validates :experience, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :phone, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  end
class Membership < ApplicationRecord
    has_many :workouts, dependent: :destroy
    has_many :trainers, through: :workouts
  
    validates :name, presence: true
    validates :phone, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :status, presence: true, inclusion: { in: %w[active inactive] }
  end
class Workout < ApplicationRecord
    belongs_to :membership
    belongs_to :trainer
  
    validates :date, presence: true
    validates :duration, presence: true, numericality: { greater_than: 0 }
  end
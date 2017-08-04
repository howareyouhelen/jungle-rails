class Review < ActiveRecord::Base
  belongs_to :product

  validates_length_of :description, :minimum => 1
  validates :rating, inclusion: 0..5
  validates :user_id, presence: true
end

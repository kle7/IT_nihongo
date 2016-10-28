class Rate < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :vote, presence: true
  enum vote: {"one_star": 1, "two_star": 2, "three_star": 3, "four_star": 4, "five_star": 5}
end

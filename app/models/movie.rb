class Movie < ActiveRecord::Base
  has_many    :conments
  has_many    :rates
  belongs_to  :user
end

class Movie < ApplicationRecord
  belongs_to :nomination_list
  validates_associated :nomination_list
end

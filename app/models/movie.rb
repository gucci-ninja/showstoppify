class Movie < ApplicationRecord
  has_many :movie_nominations
  has_many :nominated_lists, through: :movie_nominations
  validates_associated :nomination_list
end

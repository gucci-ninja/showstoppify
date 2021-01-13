class MovieNomination < ApplicationRecord
  belongs_to :nomination_list
  belongs_to :movie
end

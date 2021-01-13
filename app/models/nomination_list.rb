class NominationList < ApplicationRecord
  has_many :movie_nominations
  has_many :movies, through: :movie_nominations
  validates_length_of :movies, maximum: 5

  def as_json(options={})
    super(include: { movie_nominations: { include:  :movies } })
  end
end

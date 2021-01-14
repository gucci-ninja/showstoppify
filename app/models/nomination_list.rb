class NominationList < ApplicationRecord
  has_many :movies
  validates_length_of :movies, maximum: 5
  accepts_nested_attributes_for :movies, :allow_destroy => true

  def as_json(options={})
    super(include: :movies)
  end
end

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :imdb_id
      t.string :poster_url
      t.belongs_to :nomination_list

      t.timestamps
    end
  end
end

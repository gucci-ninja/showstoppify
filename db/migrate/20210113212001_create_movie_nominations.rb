class CreateMovieNominations < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_nominations, id: false do |t|
      t.references :nomination_list, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

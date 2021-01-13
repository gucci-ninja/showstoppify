class CreateNominationLists < ActiveRecord::Migration[6.1]
  def change
    create_table :nomination_lists do |t|
      t.string :token

      t.timestamps
    end
  end
end

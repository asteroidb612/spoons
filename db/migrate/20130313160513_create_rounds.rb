class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :tournament
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end

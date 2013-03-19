class AddAdj < ActiveRecord::Migration
  def change
    create_table :adjs do |t|
      t.string :word
      t.boolean :used, default: false
    end
  end
end

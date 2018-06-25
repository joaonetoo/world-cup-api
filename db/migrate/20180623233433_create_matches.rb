class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.date :date
      t.references :stadium, foreign_key: true

      t.timestamps
    end
  end
end

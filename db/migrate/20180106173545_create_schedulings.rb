class CreateSchedulings < ActiveRecord::Migration[5.0]
  def change
    create_table :schedulings do |t|
      t.references :client, foreign_key: true
      t.date :date
      t.time :time
      t.integer :status

      t.timestamps
    end
  end
end

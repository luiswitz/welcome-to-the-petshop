class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :total
      t.references :discount, foreign_key: true
      t.references :client, foreign_key: true
      t.text :observations
      t.integer :status
      t.date :date

      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end

class CreateDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts do |t|
      t.string :title
      t.decimal :value
      t.integer :discount

      t.timestamps
    end
  end
end

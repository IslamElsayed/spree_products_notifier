class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :spree_subscribes do |t|
      t.integer :user_id
      t.integer :variant_id

      t.timestamps
    end
  end
end

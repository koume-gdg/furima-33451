class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.integer      :price,  index:true,  null:false

      t.timestamps
    end
  end
end

class CreateKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :keys do |t|
      t.string :value
      t.string :status
      t.datetime :last_used_at

      t.timestamps
    end
  end
end

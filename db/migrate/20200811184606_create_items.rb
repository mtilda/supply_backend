class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.references :unit, null: false, foreign_key: true
      t.integer :expiration
      t.boolean :is_tracked
      t.boolean :is_depleted
      t.boolean :is_running_out
      t.decimal :average_consumption_rate_per_day, precision: 16, scale: 8
      t.decimal :average_get_time_delta, precision: 16, scale: 8
      t.references :supply, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.string :symbol
      t.string :singular
      t.string :plural

      t.timestamps
    end
  end
end

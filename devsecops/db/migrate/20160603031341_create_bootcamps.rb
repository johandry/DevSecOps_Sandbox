class CreateBootcamps < ActiveRecord::Migration
  def change
    create_table :bootcamps do |t|
      t.string :name
      t.text :description
      t.string :dates

      t.timestamps null: false
    end
  end
end

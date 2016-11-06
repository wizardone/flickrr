class CreateHistory < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.text :data
      t.references :user
    end
  end
end

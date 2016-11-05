class CreateHistory < ActiveRecord::Migration[5.0]
  def change
    create_table :history do |t|
      t.jsonb :data
      t.references :user
    end
  end
end

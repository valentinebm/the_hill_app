class CreateReigns < ActiveRecord::Migration[5.0]
  def change
    create_table :reigns do |t|
      t.references :user, index: true
      t.string :date

      t.timestamps
    end
  end
end

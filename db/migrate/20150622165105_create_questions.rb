class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end

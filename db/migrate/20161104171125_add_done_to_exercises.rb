class AddDoneToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :done, :boolean, null: false, default: false
  end
end

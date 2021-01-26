class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) {|t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    }
  end
end

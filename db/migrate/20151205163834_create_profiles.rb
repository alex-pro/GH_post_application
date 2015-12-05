class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :country
      t.date :birthday
      t.string :sex
      t.text :about
      t.text :avatar

      t.timestamps null: false
    end
  end
end

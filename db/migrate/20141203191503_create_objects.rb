class CreateObjects < ActiveRecord::Migration
  def change
    create_table :objects do |t|
      t.string :uid, unique: true, null: false, index: true
      t.string :firstName
      t.string :lastName
      t.date :dob, null: false
      t.string :dod

      t.timestamp
    end
  end
end

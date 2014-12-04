# I would use first_name instaed of firstName, i think it is a convention
# in ruby, snake-case.
# I am wondering if it makes sence to set uid to be a primary key,
# since spec seems to search by uid.

class CreateXobjects < ActiveRecord::Migration
  def change
    create_table :xobjects do |t|
      t.string :uid, unique: true, null: false, index: true
      t.string :firstName
      t.string :lastName
      t.date :dob, null: false
      t.string :dod

      t.timestamp
    end
  end
end

# Object might be less than ideal name for a class
# rails g model actually refused to generate a model called object (reserved word)
class Object < ActiveRecord::Base
  before_create :generate_uuid

  private

  # I am not sure if I am generating UID or UUID
  def generate_uuid
    begin
      self.uid = SecureRandom.hex
    end while self.class.exists?(uid: self.uid)
  end

end



# Object might be less than ideal name for a Class
# rails g model actually refused to generate a model called object (reserved word)
class Object < ActiveRecord::Base
  before_create :generate_uid

  private

  # I am not sure if I am generating UID or UUID
  def generate_uid
    begin
      # .uuid or .hex?
      self.uid = SecureRandom.uuid
    end while self.class.exists?(uid: self.uid)
  end

end



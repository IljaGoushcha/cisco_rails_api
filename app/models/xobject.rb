# Object might be less than ideal name for a Class
# rails g model actually refused to generate a model called object (reserved word)
class Xobject < ActiveRecord::Base
  before_create :generate_uid

  private
  # I am not sure if I am generating UID or UUID,
  # or is there even a difference between the two?
  def generate_uid
    begin
      # .uuid or .hex? both seem to do the same job
      self.uid = SecureRandom.uuid.gsub(/[-]/, '')
    end while self.class.exists?(uid: self.uid)
  end

end



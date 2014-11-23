class Listing < ActiveRecord::Base

has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100#" },
   :default_url => "default.jpg"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    
end

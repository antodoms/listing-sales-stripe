class Listing < ActiveRecord::Base

has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100#" },
   :default_url => "default.jpg",
   :storage => :s3, :bucket => 'antodoms' , :region => 'us-west-2', :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'], :url => "antodoms.s3-website-us-west-2.amazonaws.com"
               

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    
end

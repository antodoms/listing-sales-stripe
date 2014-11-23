class Listing < ActiveRecord::Base
	 
	 has_attached_file :image, 
        :storage => :s3, 
        :s3_credentials => Rails.root.join("config/amazon.yml"), 
        :path => "/:style/:filename",
        :styles => { :medium => "200x", :thumb => "100x100>" }  ,
        validates_attachment_content_type :file_name, :content_type => %w(image/jpeg image/jpg image/png)

end

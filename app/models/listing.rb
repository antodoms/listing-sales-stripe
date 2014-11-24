class Listing < ActiveRecord::Base

has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100#" },
   :default_url => "default.jpg", :region => 'us-west-2',
   :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
   :path => ":style/:id_:filename"
               

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  def s3_credentials
    {:bucket => 'antodoms' , :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'], :region => 'us-west-1', :s3_host_name => 's3.amazonaws.com'}
  end
end

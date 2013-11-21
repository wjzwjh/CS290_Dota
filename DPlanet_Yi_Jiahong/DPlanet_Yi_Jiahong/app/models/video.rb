class Video < ActiveRecord::Base


  attr_accessible :description, :image_url, :kind, :title ,:comment,:avatar,:comment_version,:video_url

 # ensure that there are no video review referencing this product
  has_attached_file :avatar,:preserve_files => true,:path => ":rails_root/public/:id/:filename"
  end



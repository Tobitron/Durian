require 'active_record'
require 'pry'

 	ActiveRecord::Base.establish_connection(
  adapter:  'postgresql', # or 'postgresql' or 'sqlite3'
  host:     'localhost',
  database: 'Durian_development',
)

class City < ActiveRecord::Base
end

# The purpose of this file is to check my images directory against what's in AWS and 
# upload any newly added files to my s3 durianapp bucket

added_images = ''
image_path = '/Users/tobiaskahn/Dropbox/Development/side_projects/Durian/app/assets/images'

local_images = `ls /Users/tobiaskahn/Dropbox/Development/side_projects/Durian/app/assets/images`
local_array = local_images.split("\n")

aws_images = `aws s3 ls s3://durianapp | awk '{print $4}'`
aws_array = aws_images.split("\n")

local_array.each do |image|
	unless aws_array.include?(image)
		`aws s3 cp "#{image_path + '/' + image}" s3://durianapp --acl public-read`
		 added_images << image + " "
	end
end

local_array.each do |image_url|
	image_city = image_url.sub(".jpg", '')
	array = image_city.split("_")
	array.each do |word|
		word.capitalize!
	end
	
	image_city = array.join(" ")
	city = City.find_by(name: image_city)
	city.image = "https://s3.amazonaws.com/durianapp/" + image_url
	city.save
end

puts added_images

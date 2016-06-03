# The purpose of this file is to check my images directory against what's in AWS and 
# upload any newly added files to my s3 durianapp bucket

added_images = ''
image_path = '/Users/tobiaskahn/Dropbox/Development/side_projects/Durian/app/assets/images'

local_images = `ls /Users/tobiaskahn/Dropbox/Development/side_projects/Durian/app/assets/images`
local_array = local_images.split("\n")

local_array.each do |file_name|
	file_name.downcase!
end

aws_images = `aws s3 ls s3://durianapp | awk '{print $4}'`
aws_array = aws_images.split("\n")

local_array.each do |image|
	unless aws_array.include?(image)
		`aws s3 cp "#{image_path + '/' + image}" s3://durianapp`
		 added_images << image + " "
	end
end

puts added_images

require 'fileutils'

image_path = 'main.webp' # Replace with the actual path to the main.webp image
webp_directory = '0' # Replace with the actual path to the WebP directory

# Create the WebP directory if it doesn't exist
FileUtils.mkdir_p(webp_directory)

image_data = File.binread(image_path)

(1..100000).each do |index|
  webp_file = File.join(webp_directory, "#{index}.webp")
  File.binwrite(webp_file, image_data)
  
  puts "#{image_path} copied as #{webp_file}"
end

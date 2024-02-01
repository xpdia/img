require 'fileutils'

source_file = 'main.webp'
destination_folder = 'img'

# Create the destination folder if it doesn't exist
FileUtils.mkdir_p(destination_folder)

100000.times do |i|
  destination_file = File.join(destination_folder, "#{i + 1}.webp")
  FileUtils.cp(source_file, destination_file)
  puts "#{i + 1}.webp saved"
end

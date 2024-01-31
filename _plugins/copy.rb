require 'fileutils'
require 'concurrent-ruby'

image_path = 'main.webp' # Replace with the actual path to the main.webp image
webp_directory = '_' # Replace with the actual path to the WebP directory

# Create the WebP directory if it doesn't exist
FileUtils.mkdir_p(webp_directory)

image_data = File.binread(image_path)

executor = Concurrent::ThreadPoolExecutor.new(
  min_threads: 1,
  max_threads: 10,
  max_queue: 0,
  fallback_policy: :caller_runs
)

(1..1000000).each do |index|
  executor.post do
    webp_file = File.join(webp_directory, "#{index}.webp")
    File.binwrite(webp_file, image_data)
    puts "#{webp_file} saved"
  end
end

executor.shutdown
executor.wait_for_termination

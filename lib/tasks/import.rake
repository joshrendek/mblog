namespace :import do
  desc "TODO"
  task jekyll: :environment do
    Content.delete_all
    source_dir = ARGV[1]
    puts "Importing files from #{source_dir}"
    files = Dir["#{source_dir}/*"]
    files.each do |file|
      begin
        puts "Importing: #{file}"
        meta = YAML.load_file(file)
        body = File.read(file).split("---")[2..-1].join("")
        Content.create(name: meta['title'],
                       created_at: meta['date'],
                       updated_at: meta['date'],
                       body: body)
      end
    end
  end

end

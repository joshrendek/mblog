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
        post_date = file.split('/')[-1].split("-")
        year,month,day = post_date[0].to_i, post_date[1].to_i, post_date[2].to_i
        date = Date.new(year, month, day)
        Content.create(title: meta['title'],
                       created_at: date,
                       updated_at: date,
                       body: body, state: 'published')
      end
    end
  end

end

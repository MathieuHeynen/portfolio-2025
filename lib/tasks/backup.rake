namespace :backup do
  desc "Backup database to Cloudinary"
  task database: :environment do
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    filename = "backup_#{timestamp}.sql"

    # Dump database
    system("pg_dump #{ENV['DATABASE_URL']} > tmp/#{filename}")

    # Upload to Cloudinary (ou S3)
    file = File.open("tmp/#{filename}")
    upload = Cloudinary::Uploader.upload(file,
      resource_type: :raw,
      folder: 'backups',
      public_id: filename
    )

    puts "✅ Backup uploaded: #{upload['secure_url']}"

    # Clean local file
    File.delete("tmp/#{filename}")
  end

  desc "Export works to JSON"
  task export_works: :environment do
    data = Work.all.map do |work|
      {
        title: work.title,
        client: work.client,
        description: work.description,
        number: work.number,
        slug: work.slug,
        category: work.category,
        technologies: work.technologies,
        images_count: work.images.count
      }
    end

    File.write("tmp/works_export_#{Date.today}.json", data.to_json)
    puts "✅ Works exported to tmp/works_export_#{Date.today}.json"
  end
end

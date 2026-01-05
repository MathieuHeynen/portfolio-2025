# db/seeds.rb
require "open-uri"

def attach_images_to_work(work, folder, count)
  count.times do |i|
    filename = "#{folder}-#{i + 1}.jpg"
    filepath = Rails.root.join("app/assets/images/seeds/#{filename}")

    if File.exist?(filepath)
      puts "📸 Attaching #{filename} to #{work.title}"
      file = File.open(filepath)
      work.images.attach(io: file, filename: filename)
      file.close
    else
      puts "⚠️ File not found: #{filepath} - Using placeholder"
      # Image placeholder si le fichier n'existe pas
      file = URI.open("https://via.placeholder.com/800x600/4ECDC4/ffffff?text=#{work.title}")
      work.images.attach(io: file, filename: "placeholder_#{i+1}.jpg")
    end
  rescue => e
    puts "⚠️ Failed to attach #{filename}: #{e.message}"
  end
end

puts "🧹 Cleaning existing works..."
Work.destroy_all

puts "📦 Seeding works..."

izy_chef = Work.create!(
  title: "IzyChef",
  client: "Solution SaaS B2B",
  description: "Application complète de gestion pour restaurants avec système de
                commandes, gestion des stocks via API Solucious, et tableau de bord
                analytics. Architecture Rails API + React Native.",
  number: "001",
  category: "web",
  status: "in_progress",
  featured: true,
  technologies: ["Ruby on Rails 7", "React Native", "PostgreSQL", "Redis",
                 "Sidekiq", "API REST", "WebSockets"],
  github_url: nil, # Privé
  live_url: "https://izy-chef.com",
  start_date: 3.months.ago,
  end_date: nil,
  meta_description: "Application SaaS de gestion complète pour restaurants - Rails & React Native",
  keywords: ["restaurant management", "saas", "rails api", "react native"]
)

locally = Work.create!(
  number: "001",
  client: "Le Wagon",
  title: "Final work from the bootcamp @LeWagon",
  description: "Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it?",
  slug: "locally-project"
)
attach_images_to_work(locally, "locally", 3)  # ✅ Utilise 'locally', pas 'nike'

kenta = Work.create!(
  number: "002",
  client: "Kenta Merry",
  title: "Design de site web portfolio",
  description: "Well, the way they make shows is, they make one show. That show's called a pilot.",
  slug: "kenta-portfolio"
)
attach_images_to_work(kenta, "kenta", 4)  # ✅ OK

kfe = Work.create!(
  number: "003",
  client: "K'fé",
  title: "Packaging de café bio",
  description: "Now that there is the Tec-9, a crappy spray gun from South Miami.",
  slug: "kfe-packaging"
)
attach_images_to_work(kfe, "kfe", 5)  # ✅ OK

puts "🌱 Seeding completed."

Work.all.each do |work|
  puts "🖼️ #{work.title} has #{work.images.count} image(s) attached"
end

puts "✅ #{Work.count} works seeded with images."

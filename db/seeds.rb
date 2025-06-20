require "open-uri"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def attach_images_to_work(work, folder, count)
  count.times do |i|
    filename = "#{folder}-#{i + 1}.jpg"
    filepath = Rails.root.join("app/assets/images/seeds/#{filename}")

    if File.exist?(filepath)
      puts "📸 Attaching #{filename} to #{work.title}"
      file = File.open(filepath)
      work.images.attach(io: file, filename: filename)
    else
      puts "❌ File not found: #{filepath}"
    end
  rescue => e
    puts "⚠️ Failed to attach #{filename}: #{e.message}"
  end
end

puts "📦 Seeding works and attaching images..."

nike = Work.create!(
  number: "001",
  client: "Nike",
  title: "Affiche publicitaire Nike",
  description: "Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it? Do you see a little Asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it? No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb."
)
attach_images_to_work(nike, "nike", 3)

kenta = Work.create!(
  number: "002",
  client: "Kenta Merry",
  title: "Design de site web portfolio",
  description: "Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing."
)
attach_images_to_work(kenta, "kenta", 4)

kfe = Work.create!(
  number: "003",
  client: "K'fé",
  title: "Packaging de café bio",
  description: "Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit."
)
attach_images_to_work(kfe, "kfe", 5)

puts "🌱 Seeding completed."

Work.all.each do |work|
  puts "🖼️ #{work.title} has #{work.images.count} image(s) attached"
end

puts "✅ Works seeded with images."

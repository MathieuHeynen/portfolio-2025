# db/seeds.rb
puts "🧹 Cleaning database..."
Work.destroy_all

Work.create!(
  number: "001",
  client: "Personal Work",
  title: "Character Design & Personal Illustrations",
  description: "Collection of personal artwork showcasing character design, digital illustrations, and creative explorations. Developed through years of artistic practice, these pieces demonstrate my visual storytelling abilities and unique artistic style. Created using various digital tools including Procreate, Adobe Illustrator, and Photoshop.",
  slug: "sketches",
  category: "illustration",
  featured: true,
  position: 1,
  technologies: "Procreate, Adobe Illustrator, Photoshop, Digital Drawing"
)

Work.create!(
  number: "002",
  client: "Le Wagon Bootcamp",
  title: "Locally - Authentic Travel & Local Connections",
  description: "Mobile application I conceptualized and developed during Le Wagon bootcamp. Original idea pitched and selected among multiple projects to form a 3-person development team. Locally enables travelers to discover authentic places off the beaten Instagram path through recommendations from passionate locals. Led the team as Product Owner, created UI/UX mockups, and contributed to full-stack development.",
  slug: "locally",
  category: "web",
  featured: true,
  position: 2,
  technologies: "Ruby on Rails 7, PostgreSQL, Stimulus.js, Bootstrap 5, Mapbox API, Cloudinary, Figma"
)

locally = Work.find_by(slug: "locally") || Work.last
locally.images.attach(
  io: URI.open("https://res.cloudinary.com/dngknj8ze/image/upload/v1770205917/PORTFOLIO/LOCALLY/LOCALLY-PRESA-01-251027_emssim.png"),
  filename: "locally-slide-1.png"
) if locally

Work.create!(
  number: "003",
  client: "Sylvatica",
  title: "Brand Identity for Tree Climbing Specialist",
  description: "Complete visual identity design for Sylvatica, a professional tree climbing and pruning service. Developed a comprehensive brand system including logo design, color palette, typography, and application guidelines.",
  slug: "sylvatica",
  category: "branding",
  featured: true,
  position: 3,
  technologies: "Adobe Illustrator, Photoshop, InDesign, Brand Strategy, Logo Design"
)

puts "✅ #{Work.count} projects created successfully!"

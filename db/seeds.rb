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
sketches.images.attach(
  [
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203588/PORTFOLIO/DRAWINGS/SKETCHES_aw0two.jpg",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203589/PORTFOLIO/DRAWINGS/SKETCHES3_u7offg.jpg",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203589/PORTFOLIO/DRAWINGS/SKETCHES5_jwb0jf.jpg",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203589/PORTFOLIO/DRAWINGS/SKETCHES4_gn4ont.jpg",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203590/PORTFOLIO/DRAWINGS/SKETCHES6_ktjbbk.jpg",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203590/PORTFOLIO/DRAWINGS/SKETCHES2_qwbzvs.jpg",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203590/PORTFOLIO/DRAWINGS/SKETCHES7_bvxygz.jpg",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203591/PORTFOLIO/DRAWINGS/SKETCHES8_tj0l6a.jpg",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203591/PORTFOLIO/DRAWINGS/SKETCHES9_f3ac3g.jpg",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203591/PORTFOLIO/DRAWINGS/SKETCHES10_azh9fh.jpg",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770203592/PORTFOLIO/DRAWINGS/SKETCHES11_g3qgy2.jpg"
  ].each_with_index do |url, index|
    sketches.images.attach(
      io: URI.open(url),
      filename: "sketches-slide-#{index + 1}.png"
    )
  end
)

Work.create!(
  number: "002",
  client: "Le Wagon Bootcamp",
  title: "Locally - Authentic Travel & Local Connections",
  description: "Mobile application I conceptualized and developed during Le Wagon bootcamp. Original idea pitched and selected among multiple projects to form a 3-person development team. Locally enables travelers to discover authentic places off the beaten Instagram path through recommendations from passionate locals. Led the team as Product Owner, created UI/UX mockups, and contributed to full-stack development. The app features geolocation, real-time messaging, and a curated recommendation system.",
  slug: "locally",
  category: "web",
  featured: true,
  position: 2,
  technologies: "Ruby on Rails 7, PostgreSQL, Stimulus.js, Bootstrap 5, Mapbox API, Cloudinary, Figma, UI/UX Design"
)
locally.images.attach(
  [
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1770200307/portfolio/locally/slide-1.png",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1764274766/PORTFOLIO/LOCALLY/LOCALLY-PRESA-05-251027_rjs4g4.png",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1764274766/PORTFOLIO/LOCALLY/LOCALLY-PRESA-02-251027_sfxhp3.png",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1764274766/PORTFOLIO/LOCALLY/LOCALLY-PRESA-04-251027_pq9gxg.png",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1764274766/PORTFOLIO/LOCALLY/LOCALLY-PRESA-03-251027_pvobnq.png",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1764274765/PORTFOLIO/LOCALLY/LOCALLY-PRESA-06-251027_ps90c5.png",
    "https://res.cloudinary.com/dngknj8ze/image/upload/v1764274765/PORTFOLIO/LOCALLY/LOCALLY-PRESA-07-251027_vxdjmu.png"
  ].each_with_index do |url, index|
    locally.images.attach(
      io: URI.open(url),
      filename: "locally-slide-#{index + 1}.png"
    )
  end
)

Work.create!(
  number: "003",
  client: "Sylvatica",
  title: "Brand Identity for Tree Climbing Specialist",
  description: "Complete visual identity design for Sylvatica, a professional tree climbing and pruning service. Developed a comprehensive brand system including logo design, color palette, typography, and application guidelines. The identity reflects the company's expertise in arboriculture while conveying trust, professionalism, and connection with nature. Delivered brand guidelines, business cards, vehicle graphics, and digital assets.",
  slug: "sylvatica",
  category: "branding",
  featured: true,
  position: 3,
  technologies: "Adobe Illustrator, Photoshop, InDesign, Brand Strategy, Logo Design"
)

puts "✅ #{Work.count} projects created successfully!"

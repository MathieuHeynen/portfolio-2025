# db/seeds.rb
puts "Nettoyage..."
Work.destroy_all

Work.create!(
  number: "001",
  client: "IzyChef",
  title: "Application SaaS pour restaurants",
  description: "Solution de gestion avec API Solucious",
  category: "web",  # ✅ Catégorie valide
  position: 1,
  featured: true
)

Work.create!(
  number: "002",
  client: "Portfolio",
  title: "Portfolio Personnel",
  description: "Site portfolio Rails",
  category: "web",  # ✅ Catégorie valide
  position: 2,
  featured: true
)

Work.create!(
  number: "003",
  client: "Le Wagon",
  title: "Nakyma",
  description: "Projet final bootcamp",
  category: "web",  # ✅ Catégorie valide
  position: 3
)

Work.create!(
  number: "004",
  client: "Hoet & Hoet",
  title: "Design Graphique",
  description: "8 ans d'expérience en design",
  category: "design",  # ✅ Catégorie valide
  position: 4
)

puts "✅ #{Work.count} projets créés!"

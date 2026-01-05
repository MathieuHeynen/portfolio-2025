source "https://rubygems.org"
ruby "3.1.2"

gem "rails", "~> 7.1.3", ">= 7.1.3.3"

# Core
gem "pg", "~> 1.5"              # PostgreSQL uniquement
gem "puma", ">= 5.0"
gem "bootsnap", require: false

# Frontend
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "sassc-rails"

# UI Components
gem "bootstrap", "~> 5.2"
gem "font-awesome-sass", "~> 6.5"
gem "autoprefixer-rails"

# Forms & Views
gem "simple_form"               # Tu l'as mais ne l'utilises pas
gem "jbuilder"                  # Pour l'API
gem "pagy", "~> 6.0"           # ➕ Pagination performante

# Storage
gem "activestorage"
gem "image_processing", "~> 1.2"
gem "mini_magick"
gem "cloudinary"
gem "activestorage-cloudinary-service"

# Security & Auth
gem "bcrypt", "~> 3.1.7"       # ➕ Pour l'admin
gem "rack-attack"              # ➕ Protection contre les attaques

# SEO & Performance
gem "meta-tags"                # ➕ Gestion des meta tags
gem "sitemap_generator"        # ➕ Génération sitemap
gem "friendly_id", "~> 5.5"    # ➕ URLs SEO-friendly avancées

# Monitoring
gem "sentry-ruby"              # ➕ Error tracking
gem "sentry-rails"             # ➕ Rails integration

# Background Jobs (si besoin)
# gem "sidekiq", "~> 7.0"      # Pour les jobs asynchrones
# gem "redis", ">= 4.0.1"      # Pour Sidekiq et cache


group :development, :test do
  gem "debug"
  gem "rspec-rails"            # ➕ Tests
  gem "factory_bot_rails"      # ➕ Factories pour tests
  gem "faker"                  # ➕ Données de test
  gem "dotenv-rails"           # ➕ Variables d'environnement
end

group :development do
  gem "web-console"
  gem "hotwire-livereload"
  gem "better_errors"          # ➕ Meilleurs messages d'erreur
  gem "binding_of_caller"      # ➕ Pour better_errors
  gem "bullet"                 # ➕ Détection N+1 queries
  gem "annotate"               # ➕ Annotations dans les modèles
  gem "letter_opener"          # ➕ Preview des emails
end

group :development, :test do
  gem "sqlite3", "~> 1.4"
end

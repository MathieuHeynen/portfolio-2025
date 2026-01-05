# Commandes de déploiement

## Local (avant de pousser)

```bash
# Vérifier que tout compile
RAILS_ENV=production rails assets:precompile

# Tester en production locale
RAILS_ENV=production rails server

# Nettoyer
rails assets:clobber
```

## Git

```bash
# Commit et push
git add .
git commit -m "Deploy: description"
git push origin main
```

## Render CLI

```bash
# Installer Render CLI
brew install render

# Login
render login

# Voir les logs
render logs --service portfolio-joke --tail

# Ouvrir une console
render shell --service portfolio-joke
bundle exec rails console
```

## Debug en production

```bash
# Console Rails
bundle exec rails console

# Vérifier les Works
Work.count
Work.first.images.attached?

# Vérifier Cloudinary
Rails.application.config.active_storage.service

# Vérifier les routes
Rails.application.routes.url_helpers.root_url

# Stats
puts "Works: #{Work.count}"
puts "Images: #{ActiveStorage::Attachment.count}"
puts "Storage: #{Rails.application.config.active_storage.service}"
```

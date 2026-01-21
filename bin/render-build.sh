#!/usr/bin/env bash
# exit on error
set -o errexit

echo "🔧 Starting Render build process..."

# Install dependencies
echo "📦 Installing gems..."
bundle install

# Precompile assets
echo "🎨 Precompiling assets..."
bundle exec rake assets:precompile

# Clean old assets
echo "🧹 Cleaning old assets..."
bundle exec rake assets:clean

# Run database migrations
echo "🗄️ Running migrations..."
bundle exec rake db:migrate

# Seed database only on first deploy
if [ "$RENDER_INITIAL_DEPLOY" = "true" ]; then
  echo "🌱 Seeding database (initial deploy)..."
  bundle exec rake db:seed
fi

echo "✅ Build complete!"

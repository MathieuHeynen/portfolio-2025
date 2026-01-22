#!/usr/bin/env bash
set -o errexit

echo "🔧 Installing dependencies..."
bundle install

echo "🎨 Precompiling assets..."
bundle exec rake assets:precompile

echo "✅ Build complete! Migrations will run after deployment."

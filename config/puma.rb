# Puma configuration for Render

# Threads
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Port
port ENV.fetch("PORT") { 3000 }

# Environment
environment ENV.fetch("RAILS_ENV") { "development" }

# Workers (processes)
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Preload app for performance (attention à la RAM)
preload_app!

# Worker timeout (important pour Render)
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Allow puma to be restarted by `rails restart` command
plugin :tmp_restart

# Worker lifecycle events
on_worker_boot do
  # Reconnect to database
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = ""
end

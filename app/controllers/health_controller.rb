class HealthController < ApplicationController
  def show
    checks = {
      database: check_database,
      redis: check_redis,
      cloudinary: check_cloudinary
    }

    if checks.values.all?
      render json: {
        status: 'ok',
        timestamp: Time.current,
        checks: checks
      }
    else
      render json: {
        status: 'error',
        timestamp: Time.current,
        checks: checks
      }, status: :service_unavailable
    end
  end

  private

  def check_database
    ActiveRecord::Base.connection.active?
  rescue
    false
  end

  def check_redis
    if defined?(Redis)
      Redis.current.ping == "PONG"
    else
      true  # Redis pas utilisé
    end
  rescue
    false
  end

  def check_cloudinary
    # Vérifier que Cloudinary est accessible
    Cloudinary::Api.ping
    true
  rescue
    false
  end
end

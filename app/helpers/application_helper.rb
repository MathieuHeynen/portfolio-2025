module ApplicationHelper
  # Méthode existante pour les images statiques
  def cloudinary_image(image_name, options = {})
    # Utiliser l'URL complète sans transformation automatique
    cl_image_tag("portfolio/#{image_name}",
                  options.merge(
                    secure: true,
                    sign_url: false,
                    type: "upload"
                  ))
  end

  # Nouvelle méthode pour les images ActiveStorage
  def cloudinary_image_url(attachment)
    return nil unless attachment&.attached?

    blob = attachment.blob
    cloud_name = ENV['CLOUDINARY_CLOUD_NAME']

    # Construire l'URL Cloudinary directement depuis la clé du blob
    # La clé contient déjà le chemin complet dans Cloudinary
    "https://res.cloudinary.com/#{cloud_name}/image/upload/#{blob.key}"
  end
end

module ApplicationHelper
  def cloudinary_image(image_name, options = {})
    # Utiliser l'URL complète sans transformation automatique
    cl_image_tag("portfolio/#{image_name}",
                  options.merge(
                    secure: true,
                    sign_url: false,
                    type: "upload"
                  ))
  end
end

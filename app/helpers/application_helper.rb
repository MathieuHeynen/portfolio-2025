module ApplicationHelper
  def cloudinary_image(image_name, options = {})
    cl_image_tag("portfolio/#{image_name}", options)
  end
end

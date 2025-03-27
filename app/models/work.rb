class Work < ApplicationRecord
  before_save :set_slug

  def set_slug
    self.slug = title.parameterize if slug.blank?
  end
end

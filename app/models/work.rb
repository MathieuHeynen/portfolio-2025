class Work < ApplicationRecord
  # Extensions
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Associations
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_fill: [400, 300]
    attachable.variant :medium, resize_to_fill: [800, 600]
    attachable.variant :large, resize_to_limit: [1200, 900]
  end

  has_one_attached :cover_image
  has_one_attached :og_image

  # Scopes
  scope :featured, -> { where(featured: true) }
  scope :published, -> { where(status: 'completed') }
  scope :by_position, -> { order(position: :asc) }
  scope :recent, -> { order(created_at: :desc) }
  scope :by_category, ->(cat) { where(category: cat) }

  # Validations
  validates :title, presence: true, uniqueness: true
  validates :client, presence: true
  validates :number, presence: true, uniqueness: true,
            format: { with: /\A\d{3}\z/, message: "doit être 3 chiffres" }
  validates :category, inclusion: {
    in: %w[web mobile design automation other],
    message: "%{value} n'est pas une catégorie valide"
  }
  validates :status, inclusion: { in: %w[in_progress completed] }

  # Callbacks
  before_validation :generate_number, on: :create
  after_create :set_position

  # Acts as list pour l'ordre
  # acts_as_list

  # Méthodes publiques
  def duration
    return nil unless start_date && end_date
    ((end_date - start_date) / 7).round
  end

  def increment_views!
    increment!(:views_count)
  end

  def to_param
    slug
  end

  def next
    self.class.where("position > ?", position).first
  end

  def previous
    self.class.where("position < ?", position).last
  end

  # SEO
  def meta_title
    "#{title} | #{client}"
  end

  def meta_description_text
    meta_description.presence || description&.truncate(160)
  end

  # Statut
  def completed?
    status == 'completed'
  end

  def in_progress?
    status == 'in_progress'
  end

  private

  def generate_number
    self.number ||= format('%03d', (Work.maximum(:number).to_i + 1))
  end

  def set_position
    update(position: Work.maximum(:position).to_i + 1)
  end
end

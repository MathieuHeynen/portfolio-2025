class EnhanceWorksForProfessionalPortfolio < ActiveRecord::Migration[7.1]
  def change
    # CATÉGORISATION & ORGANISATION
    add_column :works, :category, :string # 'web', 'mobile', 'design', 'branding', 'other'
    add_column :works, :subcategory, :string # Plus spécifique : 'e-commerce', 'saas', 'portfolio', etc.
    add_column :works, :work_type, :string # 'personal', 'freelance', 'agency', 'school'
    add_column :works, :position, :integer # Pour l'ordre d'affichage
    add_column :works, :featured, :boolean, default: false
    add_column :works, :published, :boolean, default: true

    # DESCRIPTIONS DÉTAILLÉES
    add_column :works, :short_description, :string, limit: 160 # Pour les cards
    add_column :works, :long_description, :text # Description complète

    # TECHNOLOGIES & COMPÉTENCES
    add_column :works, :technologies, :text, array: true, default: [] # ['Rails', 'React', 'PostgreSQL']
    add_column :works, :skills, :text, array: true, default: [] # ['UI Design', 'API Integration']
    add_column :works, :tools, :text, array: true, default: [] # ['Figma', 'VS Code', 'Git']
    add_column :works, :services, :text, array: true, default: [] # ['Design', 'Development', 'Consulting']

    # RÔLE & ÉQUIPE
    add_column :works, :role, :string # Ton rôle : 'Lead Developer', 'Full Stack', 'Designer'
    add_column :works, :team_size, :integer # Taille de l'équipe
    add_column :works, :responsibilities, :text, array: true, default: [] # Tes responsabilités
    add_column :works, :collaboration, :text # Avec qui tu as travaillé

    # DATES & DURÉE
    add_column :works, :duration_weeks, :integer
    add_column :works, :year, :integer # Année principale pour filtrer
    add_column :works, :status, :string, default: 'completed' # 'in_progress', 'completed', 'archived'

    # LIENS & RESSOURCES
    add_column :works, :live_url, :string # Site en production
    add_column :works, :github_url, :string # Repo GitHub
    add_column :works, :behance_url, :string # Si c'est du design
    add_column :works, :figma_url, :string # Maquettes Figma
    add_column :works, :demo_credentials, :jsonb # {username: 'demo', password: 'demo123'}

    # MÉTRIQUES & IMPACT
    add_column :works, :metrics, :jsonb # {users: 1000, revenue: '50k', performance: '+40%'}
    add_column :works, :achievements, :text, array: true, default: [] # Points clés de réussite
    add_column :works, :budget_range, :string # '<1k', '1k-5k', '5k-10k', '10k+'

    # SEO & META
    add_column :works, :meta_title, :string
    add_column :works, :meta_description, :text
    add_column :works, :keywords, :text, array: true, default: []
    add_column :works, :og_image_url, :string # Image spécifique pour partage social

    # COULEURS & STYLE (pour personnaliser l'affichage)
    add_column :works, :theme, :string # 'light' ou 'dark' pour l'affichage

    # DONNÉES PRIVÉES (pour toi)
    add_column :works, :private_notes, :text # Notes personnelles non publiques
    add_column :works, :lessons_learned, :text # Ce que tu as appris

    # INDEX pour les performances
    add_index :works, :category
    add_index :works, :featured
    add_index :works, :published
    add_index :works, :position
    add_index :works, :year
    add_index :works, :status
    add_index :works, :work_type
  end
end

class Admin::DashboardController < Admin::BaseController
  def index
    @stats = {
      total_works: Work.count,
      featured_count: Work.featured.count,
      total_views: Work.sum(:views_count),
      messages_count: Message.unread.count
    }

    @recent_works = Work.order(created_at: :desc).limit(5)
    @popular_works = Work.order(views_count: :desc).limit(5)
    @recent_messages = Message.order(created_at: :desc).limit(5)

    # Graphique des vues par jour (30 derniers jours)
    @views_by_day = Work.joins(:views)
                        .where('views.created_at > ?', 30.days.ago)
                        .group_by_day('views.created_at')
                        .count
  end
end

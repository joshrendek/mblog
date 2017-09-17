class Admin::DashboardController < Admin::BaseAdmin
  def index
  end

  def appreciation_graph
    render json: Appreciation.group_by_day(:created_at, range: 4.weeks.ago.beginning_of_day..Time.now).count
  end
end

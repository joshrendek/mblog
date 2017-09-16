class Admin::DashboardController < Admin::BaseAdmin
  def index
  end

  def appreciation_graph
    render json: Appreciation.group_by_day(:created_at).count
  end
end

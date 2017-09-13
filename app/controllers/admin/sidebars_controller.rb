class Admin::SidebarsController < Admin::BaseAdmin
  before_action :set_sidebar, only: [:show, :edit, :update, :destroy]

  # GET /sidebars
  # GET /sidebars.json
  def index
    @sidebars = Sidebar.all
  end

  # GET /sidebars/1
  # GET /sidebars/1.json
  def show
  end

  # GET /sidebars/new
  def new
    @sidebar = Sidebar.new
    @url = admin_sidebars_path
  end

  # GET /sidebars/1/edit
  def edit
    @url = admin_sidebar_path(@sidebar)
  end

  # POST /sidebars
  # POST /sidebars.json
  def create
    @sidebar = Sidebar.new(sidebar_params)

    respond_to do |format|
      if @sidebar.save
        format.html { redirect_to edit_admin_sidebar_path(@sidebar), notice: 'Sidebar was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /sidebars/1
  # PATCH/PUT /sidebars/1.json
  def update
    respond_to do |format|
      if @sidebar.update(sidebar_params)
        format.html { redirect_to edit_admin_sidebar_path(@sidebar), notice: 'Sidebar was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /sidebars/1
  # DELETE /sidebars/1.json
  def destroy
    @sidebar.destroy
    respond_to do |format|
      format.html { redirect_to admin_sidebars_url, notice: 'Sidebar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sidebar
      @sidebar = Sidebar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sidebar_params
      params.require(:sidebar).permit(:title, :order, :body)
    end
end

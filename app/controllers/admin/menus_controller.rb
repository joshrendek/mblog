class Admin::MenusController < Admin::BaseAdmin
  before_action :set_menu, only: [:update, :destroy]

  def index
    @menus = Menu.all
  end

  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to admin_menus_path, notice: 'Menu was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to admin_menus_path, notice: 'Menu was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to admin_menus_url, notice: 'Menu was successfully destroyed.' }
    end
  end

  private
  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :target, :order)
  end
end

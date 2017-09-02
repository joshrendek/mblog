class Admin::SettingsController < Admin::BaseAdmin
  # GET /settings
  # GET /settings.json
  def index
    @settings = Setting.all
  end

  # POST /settings
  # POST /settings.json
  def create
    settings = params[:site_settings]
    settings.each do |k,v|
      s = Setting.find_or_create_by(name: k)
      s.value = v
      s.save
    end
    redirect_to admin_settings_path, notice: 'Settings saved.'
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to @setting, notice: 'Setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @setting }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end
end

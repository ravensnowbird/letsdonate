class NgosController < ApplicationController
  before_action :set_ngo, only: [:show, :edit, :update, :destroy, :create_regions]

  # GET /ngos
  # GET /ngos.json
  def index
    @ngos = Ngo.all
  end

  # GET /ngos/1
  # GET /ngos/1.json
  def show
    @notifiers = @ngo.notifiers
  end

  # GET /ngos/new
  def new
    @ngo = Ngo.new
  end

  # GET /ngos/1/edit
  def edit
  end

  # POST /ngos
  # POST /ngos.json
  def create
    @ngo = Ngo.new(ngo_params)
    @ngo.user = current_user

    respond_to do |format|
      if @ngo.save
        @ngo.create_notifiers(params[:ngo])
        # format.html { redirect_to @ngo, notice: 'Ngo was successfully created.' }
        # format.json { render :show, status: :created, location: @ngo }
        format.html { redirect_to user_dashboard_path(:ngo_id => @ngo, :user_id => current_user.id), notice: 'Ngo was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @ngo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ngos/1
  # PATCH/PUT /ngos/1.json
  def update
    respond_to do |format|
      if @ngo.update(ngo_params)
        format.html { redirect_to @ngo, notice: 'Ngo was successfully updated.' }
        format.json { render :show, status: :ok, location: @ngo }
      else
        format.html { render :edit }
        format.json { render json: @ngo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ngos/1
  # DELETE /ngos/1.json
  def destroy
    @ngo.destroy
    respond_to do |format|
      format.html { redirect_to ngos_url, notice: 'Ngo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_regions
    regions = []
    params[:ngo].collect{|k,v| regions << {address: v["address"], lat: v["lat"], long: v["long"]}}
    @ngo.add_regions(regions)
    redirect_to :back, :notice => "Regions added successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ngo
      @ngo = Ngo.find(params[:id] || params[:ngo_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ngo_params
      params.require(:ngo).permit(:name, :address, :lat, :lang) #:notifier =>[:name,:phone,:email]
    end
end

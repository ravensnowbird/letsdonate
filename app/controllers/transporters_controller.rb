class TransportersController < ApplicationController
  before_action :set_transporter, only: [:show, :edit, :update, :destroy, :transporter_dashboard, :create_regions]
  before_filter :authenticate_user!

  # GET /transporters
  # GET /transporters.json
  def index
    @transporters = Transporter.all
  end

  # GET /transporters/1
  # GET /transporters/1.json
  def show
  end

  # GET /transporters/new
  def new
    @transporter = Transporter.new
  end

  # GET /transporters/1/edit
  def edit
  end

  # POST /transporters
  # POST /transporters.json
  def create
    #hey_wait
    @transporter = Transporter.new(transporter_params)

    respond_to do |format|
      if @transporter.save
        # format.html { redirect_to @transporter, notice: 'Transporter was successfully created.' }
        # format.json { render :show, status: :created, location: @transporter }
        format.html { redirect_to "/dashboard", notice: 'You have been successfully registered.' }
      else
        format.html { render :new }
        format.json { render json: @transporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transporters/1
  # PATCH/PUT /transporters/1.json
  def update
    respond_to do |format|
      if @transporter.update(transporter_params)
        format.html { redirect_to @transporter, notice: 'Transporter was successfully updated.' }
        format.json { render :show, status: :ok, location: @transporter }
      else
        format.html { render :edit }
        format.json { render json: @transporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transporters/1
  # DELETE /transporters/1.json
  def destroy

    @transporter.destroy
    respond_to do |format|
      format.html { redirect_to transporters_url, notice: 'Transporter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def transporter_dashboard
    @region = Region.new
    @transporter_regions = @transporter.regions if @transporter.regions.present?
  end

  def create_regions
    @transporter.add_regions([{address: params["address"], lat: params["lat"], long: params["lng"]}])
    redirect_to :back, :notice => "Region added successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transporter
      @transporter = Transporter.find(params[:id] || params[:transporter_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transporter_params
      params.require(:transporter).permit(:name, :phone, :email, :user_id)
    end
end

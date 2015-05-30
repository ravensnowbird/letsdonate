class FoodDonorsController < ApplicationController
  before_action :set_food_donor, only: [:show, :edit, :update, :destroy, :find_ngos, :notification]

  # GET /food_donors
  # GET /food_donors.json
  def index
    @food_donors = FoodDonor.all
  end

  # GET /food_donors/1
  # GET /food_donors/1.json
  def show
  end

  # GET /food_donors/new
  def new
    @food_donor = FoodDonor.new
  end

  # GET /food_donors/1/edit
  def edit
  end

  # POST /food_donors
  # POST /food_donors.json
  def create
    @food_donor = FoodDonor.new(food_donor_params)
    respond_to do |format|
      if @food_donor.save
        format.html { redirect_to food_donor_find_ngos_url(@food_donor), notice: 'Food donor was successfully created.' }
        format.json { render :show, status: :created, location: @food_donor }
      else
        format.html { render :new }
        format.json { render json: @food_donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_donors/1
  # PATCH/PUT /food_donors/1.json
  def update
    respond_to do |format|
      if @food_donor.update(food_donor_params)
        format.html { redirect_to @food_donor, notice: 'Food donor was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_donor }
      else
        format.html { render :edit }
        format.json { render json: @food_donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_donors/1
  # DELETE /food_donors/1.json
  def destroy
    @food_donor.destroy
    respond_to do |format|
      format.html { redirect_to food_donors_url, notice: 'Food donor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def find_ngos
    @ngos = Ngo.all

  end
  def notification
    # rafeeq
    # @food_donor.send_notification
    redirect_to '/', :notice => "Thank you"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_donor
      @food_donor = FoodDonor.find(params[:id] || params[:food_donor_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_donor_params
      params.require(:food_donor).permit(:has_transport, :available_till, :sufficient_for, :name, :email, :phone, :address, :lat, :lang, :food_details)
    end
end

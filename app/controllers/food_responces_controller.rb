class FoodResponcesController < ApplicationController
  before_action :set_food_responce, only: [:show, :destroy, :food_responce_transport_response]

  # GET /food_responces
  # GET /food_responces.json
  def index
    @food_responces = FoodResponce.all
  end

  # GET /food_responces/1
  # GET /food_responces/1.json
  def show
  end

  # GET /food_responces/new
  def new
    @food_responce = FoodResponce.new
  end

  # GET /food_responces/1/edit
  def edit
    @ngo = Ngo.find(params[:ngo_id])
    @food_responce =  @ngo.food_responces.find(params[:resonse_id])
  end

  # POST /food_responces
  # POST /food_responces.json
  def create
    @food_responce = FoodResponce.new(food_responce_params)

    respond_to do |format|
      if @food_responce.save
        format.html { redirect_to @food_responce, notice: 'Food responce was successfully created.' }
        format.json { render :show, status: :created, location: @food_responce }
      else
        format.html { render :new }
        format.json { render json: @food_responce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_responces/1
  # PATCH/PUT /food_responces/1.json
  def update
    @ngo = Ngo.find(params[:ngo_id])
    @food_responce =  @ngo.food_responces.find(params[:resonse_id])
    respond_to do |format|
      if @food_responce.update(food_responce_params)
        #@food_responce.after_update_action
        format.html { redirect_to '/', notice: 'Food responce was successfully updated.' }

        format.json { render :show, status: :ok, location: @food_responce }
      else
        format.html { render :edit }
        format.json { render json: @food_responce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_responces/1
  # DELETE /food_responces/1.json
  def destroy
    @food_responce.destroy
    respond_to do |format|
      format.html { redirect_to food_responces_url, notice: 'Food responce was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def food_responce_transport_response
    @food_responce.accepted_transport(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_responce
      @food_responce = FoodResponce.find(params[:id] || params[:food_responce_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_responce_params
      params.require(:food_responce).permit(:ngo_id, :food_donor_id, :status, :has_transport)
    end
end

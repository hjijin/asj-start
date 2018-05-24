class ShoppingsController < ApplicationController
  before_action :set_shopping, only: [:show, :edit, :update, :destroy]

  # GET /shoppings
  # GET /shoppings.json
  def index
    @shoppings = Shopping.all.order("created_at DESC")
  end

  # GET /shoppings/1
  # GET /shoppings/1.json
  def show
  end

  # GET /shoppings/new
  def new
    @shopping = current_user.shoppings.new
  end

  # GET /shoppings/1/edit
  def edit
  end

  # POST /shoppings
  # POST /shoppings.json
  def create
    @shopping = current_user.shoppings.new(shopping_params)

    respond_to do |format|
      if @shopping.save
        format.html { redirect_to shoppings_path, notice: 'Shopping was successfully created.' }
        format.json { render :show, status: :created, location: @shopping }
      else
        format.html { render :new }
        format.json { render json: @shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoppings/1
  # PATCH/PUT /shoppings/1.json
  def update
    respond_to do |format|
      if @shopping.update(shopping_params)
        format.html { redirect_to @shopping, notice: 'Shopping was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping }
      else
        format.html { render :edit }
        format.json { render json: @shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoppings/1
  # DELETE /shoppings/1.json
  def destroy
    @shopping.destroy
    respond_to do |format|
      format.html { redirect_to shoppings_url, notice: 'Shopping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping
      @shopping = Shopping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_params
      params.require(:shopping).permit!
    end
end

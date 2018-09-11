class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]
  before_action :find_root_categories, only: [:index, :new, :create, :edit, :update]
  before_action :check_role, only: [:edit, :update, :destroy]

  # GET /quotations
  # GET /quotations.json
  def index
    if params[:q] && params[:q][:id].present?
      category_id = params[:q][:id]
      root_category_id = QuotationCategory.find(category_id).root_id
      @q = case root_category_id
          when 1
            Quotation.ransack(quotation_category0_id_eq: category_id)
          when 2
            Quotation.ransack(quotation_category1_id_eq: category_id)
          when 3
            Quotation.ransack(quotation_category2_id_eq: category_id)
          end
      @quotations = @q.result.page(params[:page] || 1).per(params[:per_page] || 20).order(id: "DESC")
    else
      @q = Quotation.ransack(quotation_category0_id_eq: 4)
      @quotations = @q.result.page(params[:page] || 1).per(params[:per_page] || 20).order(id: "DESC")
    end
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
    authorize @quotation
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = Quotation.new(quotation_params)
    authorize @quotation
    respond_to do |format|
      if @quotation.save
        format.html { redirect_to @quotation, notice: 'Quotation was successfully created.' }
        format.json { render :show, status: :created, location: @quotation }
      else
        format.html { render :new }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1
  # PATCH/PUT /quotations/1.json
  def update
    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to @quotation, notice: 'Quotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render :edit }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation.destroy
    respond_to do |format|
      format.html { redirect_to quotations_url, notice: 'Quotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_params
      params.require(:quotation).permit!
    end

    def find_root_categories
      @root_categories = QuotationCategory.roots.order(created_at: "ASC")
    end

    def check_role
      authorize @quotation
    end
end

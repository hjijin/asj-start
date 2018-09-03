class QuotationCategoriesController < ApplicationController
  before_action :set_quotation_category, only: [:show, :edit, :update, :destroy]
  before_action :find_root_categories, only: [:new, :create, :edit, :update]

  # GET /quotation_categories
  # GET /quotation_categories.json
  def index
    if params[:id].blank?
      @quotation_categories = QuotationCategory.roots
    else
      set_quotation_category
      @quotation_categories = @quotation_category.children
    end
    @quotation_categories = @quotation_categories.page(params[:page] || 1).per(params[:per_page] || 20).order(id: "DESC")
  end

  # GET /quotation_categories/new
  def new
    @quotation_category = QuotationCategory.new
  end

  # GET /quotation_categories/1/edit
  def edit
  end

  # POST /quotation_categories
  # POST /quotation_categories.json
  def create
    @quotation_category = QuotationCategory.new(quotation_category_params)

    respond_to do |format|
      if @quotation_category.save
        format.html { redirect_to quotation_categories_path, notice: 'Quotation category was successfully created.' }
        format.json { render :show, status: :created, location: @quotation_category }
      else
        format.html { render :new }
        format.json { render json: @quotation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotation_categories/1
  # PATCH/PUT /quotation_categories/1.json
  def update
    respond_to do |format|
      if @quotation_category.update(quotation_category_params)
        format.html { redirect_to quotation_categories_path, notice: 'Quotation category was successfully updated.' }
        format.json { render :show, status: :ok, location: @quotation_category }
      else
        format.html { render :edit }
        format.json { render json: @quotation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotation_categories/1
  # DELETE /quotation_categories/1.json
  def destroy
    if @quotation_category.is_root?
      flash[:error] = "没有权限删除一级分类！"
      redirect_to quotation_categories_url
    else
      @quotation_category.destroy
      flash[:success] = "删除成功！"
      redirect_to quotation_categories_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation_category
      @quotation_category = QuotationCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_category_params
      params.require(:quotation_category).permit!
    end

    def find_root_categories
      @root_categories = QuotationCategory.roots.order(id: "DESC")
    end
end

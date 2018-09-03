class QuotationListsController < ApplicationController
  before_action :set_quotation_list, only: [:show, :edit, :update, :destroy, :add_list_item, :remove_list_item]
  before_action :check_permission, only: [:edit, :update, :destroy]
  # GET /quotation_lists
  # GET /quotation_lists.json
  def index
    @quotation_lists = QuotationList.page(params[:page] || 1).per(params[:per_page] || 15).order("created_at DESC")
  end

  # GET /quotation_lists/1
  # GET /quotation_lists/1.json
  def show
    # @q_categories = QuotationCategory.find_by_title('爱上家装饰报价清单').children.order('weight DESC')
    @new_list_item = @quotation_list.quotation_list_items.new
    @list_item = @quotation_list.quotation_list_items.order("weight ASC")
    @root_categories = QuotationCategory.roots.order(created_at: "ASC")

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='爱上家标准报价 #{Time.now.strftime('%F %R')}.xlsx'"
      }
    end
  end

  # GET /quotation_lists/new
  def new
    @quotation_list = current_user.quotation_lists.new
  end

  # GET /quotation_lists/1/edit
  def edit
  end

  # POST /quotation_lists
  # POST /quotation_lists.json
  def create
    @quotation_list = current_user.quotation_lists.new(quotation_list_params)

    respond_to do |format|
      if @quotation_list.save
        format.html { redirect_to @quotation_list, notice: 'Quotation list was successfully created.' }
        format.json { render :show, status: :created, location: @quotation_list }
      else
        format.html { render :new }
        format.json { render json: @quotation_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotation_lists/1
  # PATCH/PUT /quotation_lists/1.json
  def update
    respond_to do |format|
      if @quotation_list.update(quotation_list_params)
        format.html { redirect_to @quotation_list, notice: 'Quotation list was successfully updated.' }
        format.json { render :show, status: :ok, location: @quotation_list }
      else
        format.html { render :edit }
        format.json { render json: @quotation_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotation_lists/1
  # DELETE /quotation_lists/1.json
  def destroy
    @quotation_list.destroy
    respond_to do |format|
      format.html { redirect_to quotation_lists_url, notice: 'Quotation list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation_list
      @quotation_list = QuotationList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_list_params
      params.require(:quotation_list).permit!
    end

    def check_permission
      unless @quotation_list.editor == current_user
        render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
      end
    end
end

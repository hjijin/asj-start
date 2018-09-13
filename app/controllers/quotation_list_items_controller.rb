class QuotationListItemsController < ApplicationController
  before_action :find_quotation_list, only: [:show, :create, :update, :destroy, :add_line_item, :remove_line_item]
  before_action :find_quotation_list_item, only: [:show, :update, :destroy, :add_line_item, :remove_line_item]
  before_action :find_quotation_list_line_items, only: [:show, :add_line_item, :remove_line_item]

  def show
    @categories = QuotationCategory.first.children.order(created_at: "ASC")
  end

  def create
    @list_items = @quotation_list.quotation_list_items.new(quotation_list_item_params)

    if @list_items.save
      flash[:success] = '创建成功。'
      redirect_to @quotation_list
    else
      flash[:error] = '创建失败。'
    end

  end

  def update
    if @quotation_list_item.update(quotation_list_item_params)
      redirect_to @quotation_list
    else
      flash["error"] = @quotation_list_item.errors.messages.values.flatten.join(";")
      redirect_to @quotation_list
    end
  end

  def destroy
    @quotation_list_item.destroy
    respond_to do |format|
      format.html { redirect_to @quotation_list, notice: 'Quotation list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_line_item
    quotation = Quotation.find(params[:quotation_id])
    line_items_params = {
      quotation_category0_id: quotation[:quotation_category0_id],
      quotation_category1_id: quotation[:quotation_category1_id],
      quotation_category2_id: quotation[:quotation_category2_id],
      code: quotation[:code],
      name: quotation[:name],
      unit: quotation[:unit],
      material_costs: quotation[:material_costs],
      labor_costs: quotation[:labor_costs],
      total_amount: quotation[:total_amount],
      remark: quotation[:remark]
    }
    new_line_item = @quotation_list_item.quotation_list_line_items.new(line_items_params)

    if new_line_item.save
      find_quotation_list_line_items
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def remove_line_item
    line_item = QuotationListLineItem.find(params[:line_item_id])

    line_item.destroy if line_item.quotation_list_item_id == params[:id].to_i

    respond_to do |format|
      format.html { redirect_to @quotation_list }
      format.js
    end
  end

  private
  def quotation_list_item_params
    params.require(:quotation_list_item).permit!
  end

  def find_quotation_list
    @quotation_list = QuotationList.find(params[:quotation_list_id])
  end

  def find_quotation_list_item
    @quotation_list_item = QuotationListItem.find(params[:id])
  end

  def find_quotation_list_line_items
    @quotation_list_line_items = @quotation_list_item.quotation_list_line_items
  end
end
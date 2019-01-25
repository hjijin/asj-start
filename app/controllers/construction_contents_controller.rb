class ConstructionContentsController < ApplicationController
  before_action :set_quotation_list, only: [:index, :create, :destroy]

  def index
    @new_list_item = ConstructionContent.new quotation_list_id: params[:quotation_list_id]
  end

  def create
    @construction_content = @quotation_list.construction_contents.new(construction_content_params)
    if @construction_content.save
      redirect_to quotation_list_construction_contents_path(@quotation_list)
    end
  end

  def destroy
    if @quotation_list.construction_contents.find_by(id: params[:id]).destroy
      redirect_to quotation_list_construction_contents_path(@quotation_list)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation_list
      @quotation_list = QuotationList.find(params[:quotation_list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def construction_content_params
      params.require(:construction_content).permit!
    end
end

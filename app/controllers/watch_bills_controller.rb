class WatchBillsController < ApplicationController
  before_action :set_watch_bill, only: [:show, :edit, :update, :destroy]
  before_action :validate_date, only: [:edit, :update, :destroy]

  # GET /watch_bills
  # GET /watch_bills.json
  def index
    @watch_bills = WatchBill.all.order("duty_date DESC").page(params[:page] || 1).per(params[:per_page] || 31).order(id: "DESC")
  end

  # GET /watch_bills/1
  # GET /watch_bills/1.json
  def show
  end

  # GET /watch_bills/new
  def new
    @watch_bill = current_user.watch_bills.new
  end

  # GET /watch_bills/1/edit
  def edit
  end

  # POST /watch_bills
  # POST /watch_bills.json
  def create
    @watch_bill = current_user.watch_bills.new(watch_bill_params)

    respond_to do |format|
      if @watch_bill.save
        format.html { redirect_to watch_bills_path, notice: 'Watch bill was successfully created.' }
        format.json { render :show, status: :created, location: @watch_bill }
      else
        format.html { render :new }
        format.json { render json: @watch_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /watch_bills/1
  # PATCH/PUT /watch_bills/1.json
  def update
    respond_to do |format|
      if @watch_bill.update(watch_bill_params)
        format.html { redirect_to watch_bills_path, notice: 'Watch bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @watch_bill }
      else
        format.html { render :edit }
        format.json { render json: @watch_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watch_bills/1
  # DELETE /watch_bills/1.json
  def destroy
    @watch_bill.destroy
    respond_to do |format|
      format.html { redirect_to watch_bills_url, notice: 'Watch bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watch_bill
      @watch_bill = WatchBill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def watch_bill_params
      params.require(:watch_bill).permit!
    end

    def validate_date
      return redirect_to watch_bills_path if Date.today > @watch_bill.duty_date
    end
end

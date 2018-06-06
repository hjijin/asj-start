class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy, :add_admin, :remove_admin]
  before_action :find_departments, only: [:new, :create, :edit]

  # GET /staffs
  # GET /staffs.json
  def index
    @staffs = Staff.all.order("created_at DESC")
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
    if current_user.id != params[:id].to_i
      flash[:error] = "你只能修改自己的信息."
      redirect_to staffs_path
    end
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.create_with_password(staff_params)

    if @staff.save
      flash[:success] = "信息录入成功。"
      redirect_to staffs_path
    else
      flash[:error] = "信息录入失败。"
      render :new
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    if @staff.update(staff_params)
      flash[:success] = "信息修改成功。"
      redirect_to @staff
    else
      flash[:warning] = "信息修改失败。"
      render :edit
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    if @staff.update(active: false)
      flash[:success] = "信息修改成功。"
      redirect_to staffs_url
    end
  end

  def add_admin
    if @staff.add_role :admin
      flash[:success] = "设置管理员操作成功。"
      redirect_to staffs_path
    end
  end

  def remove_admin
    if @staff.remove_role :admin
      flash[:success] = "撤销管理员操作成功。"
      redirect_to staffs_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit!
    end

    def find_departments
      @departments = Department.all
    end
end

class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    # access_token = "Dnxq30RcdGjVbq2sTxpsQnnxFqOlfYtcUzvah7JW5k_2a_BelL-oRzyZ-UVBsWZ-dPH0JZti9ibkD86Eht67xNujW2-6URi5Alhk9Cr1cnsiQNxz6Mtc-duDwn7P1wx2qkMm3XstWOZ-bIAW1-TSyf2Pyjdp2lFU9njWt6oG4KYvD9lHlmHwxyCeMJGf21jup6H-DM86kZvdoloxw8CmoA"
    # url = "https://qyapi.weixin.qq.com/cgi-bin/checkin/getcheckindata?access_token="
    # response = get_attendance_record(url, access_token)

    # if response["errcode"] == 40014
    #   access_token = get_access_token
    #   response = get_attendance_record(url, access_token)
    # end
    # p response

    @attendances = Attendance.order("date_at DESC").page(params[:page] || 1).per(params[:per_page] || 31)

    @days = Date.today.ago(1.month).end_of_month.day
    @beginning_of_month = Date.today.ago(1.month).beginning_of_month.strftime("%F")
    @end_of_month = Date.today.ago(1.month).end_of_month.strftime("%F")
    @group_attendances = Attendance
      .where('date_at >= ? and date_at <= ?', @beginning_of_month, @end_of_month)
      .group_by(&:name)

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{Time.now.strftime('%F')} 员工打卡记录表.xlsx'"
      }
    end
  end


  def excel_import
    begin
    Attendance.import(params[:file])
    flash[:success] = "考勤导入成功。"
    redirect_to attendances_url
    rescue
      flash[:error] = "考勤导入失败。"
    redirect_to attendances_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:date_at, :staff_id, :account, :department, :rule, :times_count, :work_hours, :approval, :status, :calibration, :start_work, :end_work)
    end

    # def get_attendance_record(url, access_token)
    #   HTTParty.post(url + access_token,
    #     body: {
    #      "opencheckindatatype": 3,
    #      "starttime": 1543248000,
    #      "endtime": 1543766400,
    #      "useridlist": ["HuangJiJin"]
    #     }.to_json,
    #     headers: {
    #       'Content-Type' => 'application/json',
    #       'Accept' => 'application/json'
    #     }
    #   )
    # end

    # def get_access_token
    #   response = HTTParty.get('https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=ww15085bc12de2ebd9&corpsecret=ujHRtJQ9KVdLvyQClM1y3h-4mSLeupteliMmRFIXgbY')
    #   response["access_token"]
    # end
end

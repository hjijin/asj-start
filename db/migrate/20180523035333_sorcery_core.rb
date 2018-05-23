class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string   :phone,            :null =>    false
      t.string   :email
      t.string   :username
      t.string   :nickname
      t.string   :qq
      t.string   :wechat
      t.string   :sex
      t.string   :position
      t.string   :staff_type
      t.integer  :leader_id
      t.integer  :region_id
      t.integer  :job_number, comment: "工号"
      t.integer  :probation_month, comment: "试用期"
      t.date     :dimission_date, comment: "离职日期"
      t.date     :job_date, comment: "入职日期日期"
      t.date     :official_date, comment: "转正日期"
      t.float    :remaining_annual_leave
      t.float    :remaining_sick_leave
      t.boolean  :active, default: true
      t.string   :crypted_password
      t.string   :salt

      t.timestamps                :null => false
    end

    add_index :staffs, :email, unique: true
  end
end

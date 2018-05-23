class Staff < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  PHONE_REGEX = /\A(\+86|86)?1\d{10}\z/
  EMAIL_REGEX = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/

  validate :validate_email_or_phone, on: :create

  validates_presence_of :password, message: "密码不能为空",
    if: :need_validate_password
  validates_presence_of :password_confirmation, message: "密码确认不能为空",
    if: :need_validate_password
  validates_confirmation_of :password, message: "密码不一致",
    if: :need_validate_password
  validates_length_of :password, message: "密码最短为6位", minimum: 6,
    if: :need_validate_password

  # validates :password, length: { minimum: 3 }
  # validates :password, confirmation: true
  # validates :email, uniqueness: true

  private
  def need_validate_password
    self.new_record? ||
      (!self.password.nil? || !self.password_confirmation.nil?)
  end

  # TODO
  # 需要添加邮箱和手机号不能重复的校验
  def validate_email_or_phone
    if [self.email, self.phone].all? { |attr| attr.nil? }
      self.errors.add :base, "邮箱和手机号其中之一不能为空"
      return false
    else
      if self.phone.nil?
        if self.email.blank?
          self.errors.add :email, "邮箱不能为空"
          return false
        else
          unless self.email =~ EMAIL_REGEX
            self.errors.add :email, "邮箱格式不正确"
            return false
          end
        end
      else
        unless self.phone =~ PHONE_REGEX
          self.errors.add :phone, "手机号格式不正确"
          return false
        end

        # unless VerifyToken.available.find_by(phone: self.phone, token: self.token)
        #   self.errors.add :phone, "手机验证码不正确或者已过期"
        #   return false
        # end
      end
    end

    return true
  end
end
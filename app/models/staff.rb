class Staff < ApplicationRecord
  rolify
  authenticates_with_sorcery!

  has_many :shoppings
  has_many :meals
  has_many :goods
  belongs_to :department, optional: true
  has_many :watch_bills

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

  validates :email, uniqueness: true
  validates :birthday, presence: true

  after_create :assign_default_role
  before_save :format_birthday

  def self.create_with_password(attr={})
    generated_password = attr[:phone]
    self.create(attr.merge(password: generated_password, password_confirmation: generated_password))
  end

  private
  def assign_default_role
    self.add_role(:staff) if self.roles.blank?
  end

  def need_validate_password
    self.new_record? ||
      (!self.password.nil? || !self.password_confirmation.nil?)
  end

  def format_birthday
    self.birthday = DateTime.parse(self.birthday).strftime('%Y-%m-%d').to_s
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

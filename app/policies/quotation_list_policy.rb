class QuotationListPolicy < ApplicationPolicy
  def can_edit?
    user.has_role?(:admin)|| user == record.editor
  end


  def can_update?
    user == record.editor
  end

  def can_destroy?
    user == record.editor
  end
end
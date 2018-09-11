class QuotationCategoryPolicy < ApplicationPolicy
  def admin?
    user.has_role?(:admin)
  end

  def new?
    admin?
  end

  def create?
    new?
  end

  def edit?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end
end
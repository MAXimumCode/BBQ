class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user_have_access?(record)
  end

  def edit?
    update?
  end

  def create?
    user.present?
  end

  def update?
    user_is_owner?(record)
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_owner?(event)
    user.present? && (event&.user) == user
  end

  def user_have_access?(event)
    event.pincode.blank? || user.present? && (event.user) == user
  end
end
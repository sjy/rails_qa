class DataRecordPolicy < ApplicationPolicy
  def update?
    user.reviewer
  end

  def destroy?
    user.reviewer
  end
end

class DataRecordPolicy < ApplicationPolicy
  def update?
    user.role == "reviewer"
  end

  def destroy?
    user.role == "reviewer"
  end
end

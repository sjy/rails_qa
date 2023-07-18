class DataRecordPolicy < ApplicationPolicy
  def update?
    user.role == "reviewer"
  end

  def destroy?
    user.role == "reviewer"
  end

  def revision?
    user.role == "editor"
  end

  def review?
    user.role == "reviewer"
  end
end

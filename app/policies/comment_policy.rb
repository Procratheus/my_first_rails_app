class CommentPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && (record.user = user || admin.user? || admin.moderator?)
  end
  
end
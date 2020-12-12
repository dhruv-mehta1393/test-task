class CampaignPolicy < ApplicationPolicy

  def create?
    user.role == 'Expert'
  end

  def show?
    record.published? || record.user == user
  end

  def new?
    create?
  end
end

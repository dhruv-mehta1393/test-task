class UserPolicy < ApplicationPolicy

  def create?
    user.role == 'Expert'
  end

  def show?
    record.published? || record.user == user
  end

  def new?
    create?
  end

  def show_ideas?
    create?
  end

  def index
    create?
  end
end

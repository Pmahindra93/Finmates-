class OwnContentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.admin
  end

  def show?
    true
  end
end

class OmniauthCallbacksPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def facebook?
    true
  end
end

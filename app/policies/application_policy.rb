# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user

    @user = user
    @record = record
  end

  def index?
    user.member?
  end

  def create?
    user.member?
  end

  def show?
    user.member?
  end

  def update?
    user.member?
  end

  def destroy?
    user.member?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, 'must be logged in' unless user

      @user = user
      @scope = scope
    end

    def resolve
      if user.super_admin?
        scope.kept
      elsif user.member?
        scope.kept.where(client: user.client)
      else
        scope.none
      end
    end
  end
end

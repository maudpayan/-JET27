class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show?
    record.user == user || record.jet.user == user
  end

  def create?
    return true
  end

  def new?
    create?
  end

  def update?
    record.user == user || record.jet.user == user
  end

  def edit?
    update?
  end

  def destroy?
    record.user == user
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end

class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def index?
    false
  end

  def show?
    true
  end

  def create?
    false || @user.admin # tout le monde peut crééer
  end

  def new?
    create? # => create renvoie true donc new? = true
  end

  def update?
    @user == @record.user || @user.admin
  end

  def edit?
    update? # j'appelle la valeur de la méthode #edit?
  end

  def destroy?
    @user == @record.user || @user.admin # true || false
  end
end

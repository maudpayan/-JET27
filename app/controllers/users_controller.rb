class UsersController < ApplicationController
  def show
    @user = current_user
    @jets = current_user.jets
  end
end

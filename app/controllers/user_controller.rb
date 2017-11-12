class UserController < ApplicationController
  def index
    @user = current_user
    @test_sets = @user.test_sets
  end

  def after_sign_in_path_for(resource)
    account_path
  end
end

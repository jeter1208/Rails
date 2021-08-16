class UsersController < ApplicationController
  def profile
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to "/"
    else
      render 
    end
  end

  def sign_up
    @user = User.new
  end

  # def create
  #   render html:
  # end

  private
  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :account         
                                    )
  end
end

class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = t '.success'
      redirect_back_or_to root_path
    else
      @errors = [t('errors.messages.invalid_login')]
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:success] = t '.success'
    redirect_to root_path, status: :see_other
  end
end

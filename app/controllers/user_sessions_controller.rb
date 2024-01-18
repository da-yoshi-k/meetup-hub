class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path
    else
      @errors = ['メールアドレスまたはパスワードが間違っています。']
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end

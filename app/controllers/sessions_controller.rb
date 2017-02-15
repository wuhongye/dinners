class SessionsController < ApplicationController

  def new
    
  end

  def create

    @user = User.authenticate(params[:username], params[:password])
    if @user
      signin_user @user
      
      render json: {
        status: 'ok',
        msg: {
          redirect_url: root_path
        }
      }
    else
      render json: {
        status: 'error',
        msg: "用户名或密码不正确"
      }
    end
  end

  def destroy
    logout_user
    
    flash[:notice] = "退出成功"
    @user = User.find_by(username: params[:username], password: params[:passwod])
    if @user
      session[:user_id] = @user_id
      flash[:notice] = "登陆成功"
      redirect_to root_path
    else
      flash[:notice] = "用户名或密码不正确"
      render action: :new
    end
  end
  
 
end
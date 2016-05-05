class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if @user.type == "Mentor"
        redirect_to user_path(current_user)
      elsif @user.type == "Student"
        redirect_to user_path(current_user)
      else
        redirect_to new_user_path
      end
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @appointments = Appointment.where(mentor_id: current_user.id).where("datetime < ?", DateTime.now).order(datetime: :desc)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :phase, :password, :type)
  end

end

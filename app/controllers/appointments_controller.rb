class AppointmentsController < ApplicationController

  def index
    if current_user.type == "Mentor"
      @appointments = Appointment.where(mentor_id: current_user.id)
    elsif
      @appointments = Appointment.all
    else
      redirect_to root_path
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @review = Review.new
    @student = @appointment.student
    @mentor = @appointment.mentor
    @reviews = @appointment.reviews
    if @reviews.first
      @type = @reviews.first.author.type
    elsif @reviews.last
      @type = @reviews.last.author.type
    end
  end

  def new
    @appointment = Appointment.new
    @skills = Skill.all
  end

  def create
    @time_format = params[:appointment]["time(4i)"].to_s + ":" + params[:appointment]["time(5i)"].to_s
    @appointment = Appointment.new(date: params[:appointment][:date], time: @time_format, mentor_id: current_user.id)
    params[:appointment][:skills].select do |skill, value|
      if value == "1"
        @appointment.skills << Skill.where(name: skill)
      end
    end
    if @appointment.skills.empty?
      render 'new'
    end
    if @appointment.save
      redirect_to appointments_path
    else
      render 'new'
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date, :time, :mentor_id)
  end
end

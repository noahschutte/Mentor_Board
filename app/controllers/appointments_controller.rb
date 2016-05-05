class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
    @review = Review.new
    @student = @appointment.student
    @mentor = @appointment.mentor
    @reviews = @appointment.reviews
    @type = @reviews.first.author.type
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date, :time)
  end
end

class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.where(doctor_id: params[:doctor_id])
    render json: @appointments
  end

  def new
    # not sure if I would want to return some kind of object here, tbd
  end

  def create
    @newAppointment = Appointment.new(appointment_params)

    if @newAppointment.save
      render json: @newAppointment
    end
  end

  def edit
    @appointmentToUpdate = Appointment.find(params[:id])
    render json: @appointmentToUpdate
  end

  def update
    @appointmentToUpdate = Appointment.find(params[:id])

    if @appointmentToUpdate.save
      render json: @appointmentToUpdate
    end
  end

  def destroy
    @appointmentToDestroy = Appointment.find(params[:id])

    if @appointmentToDestroy.destroy
      render json: @appointmentToDestroy
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :time)
  end
end

class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def new
    # not sure if I would want to return some kind of object here, tbd
  end

  def create
    @newDoctor = Doctor.new(doctor_params)

    if @newDoctor.save
      render json: @newDoctor
    end
  end

  def edit
    @doctorToUpdate = Doctor.find(params[:id])
    render json: @doctorToUpdate
  end

  def update
    @doctorToUpdate = Doctor.find(params[:id])

    if @doctorToUpdate.save
      render json: @doctorToUpdate
    end
  end

  def destroy
    @doctorToDestroy = Doctor.find(params[:id])

    if @doctorToDestroy.destroy
      render json: @doctorToDestroy
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :email)
  end
end

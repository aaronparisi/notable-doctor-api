class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    render json: @patients
  end

  def new
    # not sure if I would want to return some kind of object here, tbd
  end

  def create
    @newPatient = Doctor.new(patient_params)

    if @newPatient.save
      render json: @newPatient
    end
  end

  def edit
    @PatientToUpdate = Patient.find(params[:id])
    render json: @PatientToUpdate
  end

  def update
    @PatientToUpdate = Patient.find(params[:id])

    if @PatientToUpdate.save
      render json: @PatientToUpdate
    end
  end

  def destroy
    @patientToDestroy = Patient.find(params[:id])

    if @patientToDestroy.destroy
      render json: @patientToDestroy
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email)
  end
end

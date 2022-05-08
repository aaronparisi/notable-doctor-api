class Doctor < ApplicationRecord
  validates :firstName, :lastName, :email, presence: true

  has_many :appointments
  has_many :patients, through: :appointments

  cattr_accessor :all_times
  self.all_times = []

    for hour in 0...24 do
      self.all_times.push(Time.new(2022, 5, 8, hour, 0))
      self.all_times.push(Time.new(2022, 5, 8, hour, 15))
      self.all_times.push(Time.new(2022, 5, 8, hour, 30))
      self.all_times.push(Time.new(2022, 5, 8, hour, 45))
    end
  
  def get_available_times
    myAppts = Appointment.where(doctor_id: self.id)

    return self.all_times.select do |time|
      myAppts.select{|apt| apt.time === time}.length <= 3
    end
  end

  def has_time_for_appt?(time)
    return Appointment.where(doctor_id: self.id, time: time).length <= 3
  end
end

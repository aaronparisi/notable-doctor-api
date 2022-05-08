class Appointment < ApplicationRecord
  validate :acceptable_time

  belongs_to :doctor
  belongs_to :patient

  def on_fifteens(time)
    # returns true if the time is X:00, X:15, X:30, X:45
    return time.min % 15 === 0
  end

  def acceptable_time
    apptDoctor = Doctor.find(self.doctor_id)
    return on_fifteens(self.time) && apptDoctor.has_time_for_appt?(self.time) 
  end
end

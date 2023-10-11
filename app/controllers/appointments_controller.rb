class AppointmentsController < ApplicationController
	before_action :set_doctor, only: [:show, :update, :destroy]

	def index
		appoint = Appointment.all
		render json: appoint
	end

	def show
		render json: doctor
	end

	def create
		appoint = Appointment.new(appoint_params)
		if appoint.save
			render json: appoint
		else
			render :new
		end
	end

	def update
	  	appoint = appoint.update(appoint_params)
    puts "Appointment has been updated successfully"
    render json: appoint
  end

	  def destroy
	  	appoint = appoint.destroy(appoint_params)
    puts "Appointment has been deleted successfully"
    render json: appoint
  end

	private

	def set_appoint
		appoint = Appointment.find(params[:id])
	end

	def appoint_params
	 params.require(:appoint).permit(:doctor_id, :patient_id, :appointment_time)
	end

end
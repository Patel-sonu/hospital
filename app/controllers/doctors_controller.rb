class DoctorsController < ApplicationController

	before_action :set_doctor, only: [:show, :edit, :update, :destroy]

	def index
		@doctors = Doctor.all
		# render json: @doctors
	end

	def show
	end

	def new
		@doctor = Doctor.new
	end

	def edit
	end

	def create
		@doctor = Doctor.new(doctor_params)
	    if @doctor.save
	    # 	response_hash = {
  		# 		message: "Doctor has been created successfully",
  		# 		data: DoctorSerializer.new(doctor).serializable_hash}
			# render json: response_hash
	    # end
	   redirect_to doctors_path ,notice: "Doctor has been created successfully"
  	else
  		render :new
  	end
  	
	end

	def login
    doctor = Doctor.find_by(email: params[:email])

    if doctor && doctor.authenticate(params[:password])
      payload = { doctor_id: doctor.id }
      secret_key = Rails.application.secrets.secret_key_base
      token = JWT.encode(payload, secret_key, 'HS256')
      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

	def update
	  @doctor = @doctor.update(doctor_params)
    puts "doctor has been updated successfully"
    render json: @doctor
  end

	  def destroy
	  	
	  	@doctor.destroy
    puts "doctor has been deleted successfully"
  end

private

	def set_doctor
		
		@doctor = Doctor.find(params[:id])
	end

	def doctor_params
		
	params.require(:doctor).permit(:name, :specialization, :email, :password, :password_confirmation)
	end
end
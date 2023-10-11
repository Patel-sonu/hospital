class PatientsController < ApplicationController
	def index
		patient = Patient.all
		render json: patient
	end

	def show
		render json:patient
	end

	def create
		patient = Patient.new(patient_params)
		if patient.save
			render json: patient, notice: "hey its created"
		else
			render :new
		end
	end
end
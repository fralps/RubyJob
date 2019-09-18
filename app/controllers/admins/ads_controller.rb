class Admins::AdsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_if_admin

	def index
		@ads = Ad.all.reverse
	end

	def show
		@ad = Ad.find(params[:id])
	end

	def edit
		@ad = Ad.find(params[:id])
	end

	def update
		@ad = Ad.find(params[:id])

		if @ad.update(title: params[:title], location: params[:location], job_description: params[:job_description], profile_description: params[:profile_description], contract: params[:contract], salary: params[:salary], experience: params[:experience])
			redirect_to admins_ads_path
			flash[:success] = "Vous avez bien édité l'annonce 👍"
		else
			flash[:alert] = "Vous n'avez pas rempli tous les champs, veuillez réessayez svp"
			render :edit
		end
	end

	def destroy
		@ad = Ad.find(params[:id])	
		if @ad.destroy
			redirect_to admins_ads_path
			flash[:success] = "Vous avez bien supprimé l'annonce"
		else 
			flash[:alert] = "Un problème est survenu"
			render :edit
		end
	end

	def check_if_admin
		if current_user.is_admin == false
			flash[:error] = "Vous n'êtes pas un administrateur !"
			redirect_to root_path
		end
	end
end

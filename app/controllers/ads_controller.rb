class AdsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


	def index
		@ads = Ad.all.reverse
	end

	def show
		@ad = Ad.find(params[:id])
	end

	def new
		@ad = Ad.new
	end

	def create
	@ad = Ad.new(user_id: current_user.id, title: params[:title], location: params[:location], job_description: params[:job_description], profile_description: params[:profile_description], contract: params[:contract], salary: params[:salary], experience: params[:experience], email: params[:email], image_url: params[:image_url])

		if @ad.save
			redirect_to user_path(current_user)
			flash[:success] = "Votre annonce a bien été créée."
		else
			render :new
		end	
	end

	def edit
		@ad = Ad.find(params[:id])
		# @user = User.find(params[:id])
		redirect_to root_path, notice: "Vous ne pouvez pas éditer l'annonce d'autrui !" unless @ad.user == current_user
	end

	def update
		@ad = Ad.find(params[:id])

		if @ad.user == current_user
			if @ad.update(title: params[:title], location: params[:location], job_description: params[:job_description], profile_description: params[:profile_description], contract: params[:contract], salary: params[:salary], experience: params[:experience])
				redirect_to ad_path(@ad)
				flash[:success] = "Votre annonce a bien été modifiée"
			else
				flash[:alert] = "Vous n'avez pas rempli tous les champs, veuillez réessayez svp"
				render :edit
			end
		else
			redirect_to root_path, notice: "Vous ne pouvez pas éditer l'annonce d'autrui"
		end	
	end

	def destroy
		@ad = Ad.find(params[:id])	
		if @ad.destroy
			redirect_to user_path(current_user)
			flash[:success] = "Votre annonce a bien été supprimée"
		else 
			flash[:alert] = "Un problème est survenu"
			render :edit
		end
	end
end

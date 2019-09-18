class UsersController < ApplicationController
	before_action :dont_show
	before_action :authenticate_user!
	
	def show
		@user = User.friendly.find(params[:id])
	end

	def dont_show
		@user = User.friendly.find(params[:id])
		if (@user != current_user) 
			redirect_to root_path flash[:alert] = "Information confidentielle" 
		end
	end

	def edit
		@user = User.friendly.find(params[:id])
	end

	def update
		@user = User.friendly.find(params[:id])
		if current_user == @user
			if @user.update(company: params[:company])
				redirect_to user_path 
				flash[:success] = "Votre profil a été édité avec succès 👍"
			else 
				flash[:alert] = "Un problème est survenu, veuillez reessayer"
				render :edit
			end
		else
			redirect_to root_path, notice: "Vous n'avez pas accès à ce profil !"
		end	
	end

	def destroy
		@user = User.friendly.find(params[:id])
		@user.destroy
		redirect_to "/"
		flash[:success] = "Vous nous quittez déjà 😢 ! À bientôt.."
	end
end

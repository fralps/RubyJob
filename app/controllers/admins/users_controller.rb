class Admins::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_if_admin
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.friendly.find(params[:id])
		@user.destroy
		redirect_to admins_users_path
		flash[:success] = "Le profil a bien été supprimé."
	end

	def check_if_admin
		if current_user.is_admin == false
			flash[:error] = "Vous n'êtes pas un administrateur !"
			redirect_to root_path
		end
	end

end

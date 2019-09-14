class AdsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


	def index
		@ads = Ad.all
	end

	def show
		@ad = Ad.find(params[:id])
	end

	def new
		@ad = Ad.new
	end

	def create	

	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end
end

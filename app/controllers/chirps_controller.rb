class ChirpsController < ApplicationController
	before_action :set_chirp, only: [:show, :edit, :destroy, :update]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	def index 
		@chirps = Chirp.last(10).reverse 
	end
	
	def new 
		@chirp = Chirp.new 
	end
	
	def show 
		
	end
	
	def edit
		
	end
	
	def recent 
		@chirp = Chirp.last 
		render :show
	end
	
	
	def create 
		@chirp = Chirp.new(chirp_params)
		if @chirp.save 
		
			redirect_to @chirp, notice: "New chirp created!"
		else 
			render :new 
		end
	end
	
	def update 
		if @chirp.update(chirp_params)
			redirect_to @chirp, notice: "Chirp updated!"
		else 
			render :edit
		end
	end
	
	def destroy 
		@chirp.destroy 
		redirect_to chirps_path, notice: "Chirp was deleted."
	end
	
	
	private 
	
	def chirp_params 
		params.require(:chirp).permit(:body).merge(user: current_user)
	end
	
	def set_chirp
		begin
		 @chirp = Chirp.find(params[:id])
		rescue 
		 flash[:notice] = "That Chirp is not available."
		 redirect_to chirps_path
		end
	end
end

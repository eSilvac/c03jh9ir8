class ActorsController < ApplicationController
	def index
		@actors = Actor.all
	end
	def new
		@actor = Actor.new
	end
	def create
		@actor = Actor.new(actor_params)
		#@actor.update(alive:false)
		if @actor.save
			@actor.death_date && @actor.death_place != nil ? @actor.update(alive:false) : @actor.update(alive:true)
			redirect_to actors_path
		else
			render :new	
		end
	end
	private
	  	def actor_params
	  		params.require(:actor).permit(:name, :image_url, :bio, :alive, :birth_date, :birth_place, :death_date, :death_place)
	  	end
end

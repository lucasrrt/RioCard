class TravelsController < ApplicationController
	before_action :set_travel, only: [:show, :edit, :update, :destroy]

	# GET /travels
	# GET /travels.json
	def index
		@travels = Travel.all.order(:created_at)
	end

	# GET /travels/1
	# GET /travels/1.json
	def show
	end

	# GET /travels/new
	def new
		@cards = Card.all.order(:created_at)
		@vehicles = Vehicle.all.order(:created_at)
		@travel = Travel.new
	end

	# GET /travels/1/edit
	def edit
		@cards = Card.all.order(:created_at)
		@vehicles = Vehicle.all.order(:created_at)
	end

	# POST /travels
	# POST /travels.json
	def create
		@travel = Travel.new(travel_params)
		price = @travel.vehicle.price
		balance = @travel.card.balance
		user = @travel.card.user if @travel.card.user
		#TODO lógica do: se for a mesma condução, o usuário tem que esperar mais de uma hora para valer o benefício
		if params[:fingerprint] and params[:fingerprint] == user.fingerprint
			if user.hasFreePass? or @travel.second_valid_travel?
				@travel.condition = "freePass"
			else
				@travel.condition = "valid"
			end
		end

		respond_to do |format|
			if balance > price or @travel.condition == "freePass"
				if @travel.save
					format.html { redirect_to @travel, notice: 'Travel was successfully created.' }
					format.json { render :show, status: :created, location: @travel }
				else
					format.html { render :new }
					format.json { render json: @travel.errors, status: :unprocessable_entity }
				end
			else
				format.html { render :insufficient_balance }
				format.json { render json: {message: "insufficient balance"}, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /travels/1
	# PATCH/PUT /travels/1.json
	def update
		respond_to do |format|
			if @travel.update(travel_params)
				format.html { redirect_to @travel, notice: 'Travel was successfully updated.' }
				format.json { render :show, status: :ok, location: @travel }
			else
				format.html { render :edit }
				format.json { render json: @travel.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /travels/1
	# DELETE /travels/1.json
	def destroy
		@travel.destroy
		respond_to do |format|
			format.html { redirect_to travels_url, notice: 'Travel was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_travel
		@travel = Travel.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def travel_params
		params.require(:travel).permit(:vehicle_id, :card_id)
	end
end

class RechargesController < ApplicationController
	before_action :set_recharge, only: [:show, :edit, :update, :destroy]

	# GET /recharges
	# GET /recharges.json
	def index
		@recharges = Recharge.all.order(:created_at)
	end

	# GET /recharges/1
	# GET /recharges/1.json
	def show
	end

	# GET /recharges/new
	def new
		@recharge = Recharge.new
		if params[:card_id]
			@recharge.card = Card.find params[:card_id]
		end
	end

	# GET /recharges/1/edit
	def edit
	end

	# POST /recharges
	# POST /recharges.json
	def create
		@recharge = Recharge.new(recharge_params)

		respond_to do |format|
			if @recharge.save
				format.html { redirect_to @recharge, notice: 'Recharge was successfully created.' }
				format.json { render :show, status: :created, location: @recharge }
			else
				format.html { render :new }
				format.json { render json: @recharge.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /recharges/1
	# PATCH/PUT /recharges/1.json
	def update
		respond_to do |format|
			if @recharge.update(recharge_params)
				format.html { redirect_to @recharge, notice: 'Recharge was successfully updated.' }
				format.json { render :show, status: :ok, location: @recharge }
			else
				format.html { render :edit }
				format.json { render json: @recharge.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /recharges/1
	# DELETE /recharges/1.json
	def destroy
		@recharge.destroy
		respond_to do |format|
			format.html { redirect_to recharges_url, notice: 'Recharge was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_recharge
		@recharge = Recharge.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def recharge_params
		params.require(:recharge).permit(:card_id, :value)
	end
end

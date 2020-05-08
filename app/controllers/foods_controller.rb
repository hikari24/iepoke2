class FoodsController < ApplicationController
	def new
		@food = Food.new
	end

	def create
		@food = Food.new(food_params)
		@food.user_id = current_user.id
		@food.save
		redirect_to food_path(@food)

	end

	def show
		@food = Food.find(params[:id])
	end

	def index
		@user = current_user.id
		@foods = Food.where(user_id: current_user.id)
	end

	def edit
		@food = Food.find(params[:id])
	end

    def update
    	@food = Food.find(params[:id])
    	@food.update
    	redirect_to food_path(@food)
    end

	def destroy
		@food = Food.find(params[:id])
		@food.destroy
		redirect_to foods_path
	end

	private
	def food_params
		params.require(:food).permit(:user_id, :category_id, :name, :quantity, :purchase_date, :expiry_date, :wish_list)
	end
end

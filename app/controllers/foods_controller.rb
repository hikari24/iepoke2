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
		if params[:category_id]
		@one_foods = Food.where(category_id: params[:category_id])
		@foods = @one_foods.all

		else
		@user = current_user.id
		@foods = Food.where(user_id: current_user.id)
		end
	end

	def edit
		@food = Food.find(params[:id])
	end

    def update
    	@food = Food.find(params[:id])

    	#@food.user_id = current_user.id
    	@food.update(food_params)
    	redirect_to food_path(@food)
    end

	def destroy
		@food = Food.find(params[:id])
		@food.destroy
		redirect_to foods_path
	end

	def wish_list
	end

	private
	def food_params
		params.require(:food).permit(:user_id, :category_id, :name, :quantity, :purchase_date, :expiry_date, :wish_list)
	end
end

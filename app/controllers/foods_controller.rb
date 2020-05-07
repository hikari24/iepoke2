class FoodsController < ApplicationController
	def new
		@food = Food.new
	end

	def create
		@food = Food.new(food_params)
		@food.save

	end

	def show
	end

	def index
	end

	def edit
	end

    def update
    end

	def destroy
	end

	private
	def food_params
		params.require(:foob).permit(:user_id, :category_id, :name, :purchase_date, :expiry_date, :wish_list)
	end
end
end

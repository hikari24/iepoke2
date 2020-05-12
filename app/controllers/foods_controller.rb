class FoodsController < ApplicationController
	 before_action :set_search, only: [:index]

  	def set_search
    	@q = Food.ransack(params[:q])
    	@foods = @q.result
    	@categories = Category.where(user_id: current_user.id)
  	end

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
		if params[:category_id] #カテゴリー一覧から飛んできたとき
		@one_foods = Food.where(category_id: params[:category_id])
		@foods = @one_foods.all
		elsif params[:q]
		@q = Food.ransack(params[:q])
  		@search_foods = @q.result
  		@foods = @search_foods.where(user_id: current_user.id)
		else
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
		food = Food.where(wish_list: true)
		@foods = food.where(user_id: current_user.id)

	end

	def wish_list_create
		@food = Food.find(params[:id])
		@food.update(wish_list: true)
		redirect_to request.referrer || root_url
	end

	def wish_list_destroy
		@food = Food.find(params[:id])
		@food.update(wish_list: false)
		redirect_to request.referrer || root_url
	end

	private
	def food_params
		params.require(:food).permit(:user_id, :category_id, :name, :quantity, :purchase_date, :expiry_date, :wish_list)
	end


	# def search_params
 #    params.require(:q).permit(:sorts, :category_id)
 #    # 他のパラメーターもここに入れる
 #  	end
end

class ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
	  @products = Product.all
	  render json: {products: @products.collect{|p| p.to_hash}}, status: :ok
	end

	def show
		@product = Product.find(params[:id])
		render json: {product: @product}, status: :ok
	end

	def create
		product = ProductService.new(params[:product], params[:tags], params[:categories], params[:images])
		status = product.create
		render json: {message: status[:message]}, status: status[:status] ? 200 : 400
	end

	def update
		@product = ProductService.new(params[:product], params[:tags], params[:categories], params[:images])
		status = @product.update(params[:id])
		render json: {message: status[:message]}, status: status[:status] ? 200 : 400
	end

end

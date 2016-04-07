require "sequel"
class ProductService

  def initialize(product, tags, categories, images)
    @price = product[:price]
    @expire_date = product[:expire_date]
    @name = product[:name]
    @sku_id = product[:sku_id]
    @tags = tags
    @images = images
    @categories = categories
  end


  def create
  	@product = Product.new({price: @price, expire_date: date_to_time, name: @name, sku_id: @sku_id})
  	@product.tags = add_tags
  	@product.categories = add_categories
  	@product.images = add_images
  	if @product.save
  		return {message: "Added Successfully", status: true}
  	else
  		return {message: "Some issue Occur", status: false}
  	end
  end

  def update(id)
  	@product = Product.find(id)
  	if @product.update({price: @price, expire_date: date_to_time, name: @name, sku_id: @sku_id})
  		{message: "Added Successfully", status: true}
  	else
  		{message: "Some issue Occur", status: false}
  	end
  end

  private
  attr_accessor :price, :expire_date, :name, :sku_id

  def date_to_time
  	Date.strptime(@expire_date).to_time.to_i
  end

  def add_tags
  	@tags.collect{|tag| Tag.new(name: tag)}
  end

  def add_images
  	@images.collect{|img| Image.new(path: img[:image_path], :avatar => File.new(open(img[:image_path]), 'r'))}
  end

  def add_categories
  	@categories.collect{|cat| Category.new(:name => cat)}
  end

end
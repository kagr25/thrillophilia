class Product < ActiveRecord::Base
	has_many :images
	has_many :tags
	has_many :categories

	def to_hash
		{
			name: self.name,
			sku_id: self.sku_id,
			price: self.price,
			image: self.images.first.path
		}
	end
end

class Article < ActiveRecord::Base
    has_many :comments
    belongs_to :user 
	validates :ProductName, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    validates :price, presence: true, length: {minimum: 1, maximum: 6}
    validates :user_id, presence: true

    def self.in_price_range(min_value,max_value)
    	Article.where("price >= #{min_value} and price <= #{max_value}")#(price: min_value..max_value)
    end

end

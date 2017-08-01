class Article < ActiveRecord::Base
	validates :ProductName, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    validates :price, presence: true, length: {minimum: 1, maximum: 6}
end

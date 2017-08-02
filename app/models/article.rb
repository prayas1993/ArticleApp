class Article < ActiveRecord::Base
    belongs_to :user 
	validates :ProductName, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    validates :price, presence: true, length: {minimum: 1, maximum: 6}
    validates :user_id, presence: true
end
